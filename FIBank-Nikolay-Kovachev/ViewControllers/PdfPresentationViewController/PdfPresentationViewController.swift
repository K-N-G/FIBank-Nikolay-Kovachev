//
//  PdfPresentationViewController.swift
//  FIBank-Nikolay-Kovachev
//
//  Created by KNG on 16.04.24.
//

import UIKit
import PDFKit
import JGProgressHUD

class PdfPresentationViewController: UIViewController, PDFViewDelegate{
    @IBOutlet weak var pdfView: PDFView!
    
    var pdfUrl: PdfUrl?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showProgressHUD()
        NotificationCenter.default.setObserver(self, selector: #selector(handlePageChange(notification:)), name: Notification.Name.PDFViewVisiblePagesChanged, object: nil)
        
        guard let pdfUrl = pdfUrl,
              let url = URL(string: pdfUrl.rawValue) else {
            self.navigationController?.popViewController(animated: true)
            return
        }
        DispatchQueue.global(qos: .userInitiated).async {
            self.loadPDFDocument(from: url) { document in
                self.dismissProgressHUD()
                if let document = document {
                    self.pdfView.document = document
                    self.pdfView.delegate = self
                    self.pdfView.autoScales = true
                } else {
                    self.showError(error: "Еrror loading information", delay: 3.0, onDismiss: {
                        self.navigationController?.popViewController(animated: true)
                    })
                }
            }
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        UserInteractionManager.stopTimer()
    }
    
    @objc private func handlePageChange(notification: Notification)
    {
        UserInteractionManager.startTimer()
    }
    
    func loadPDFDocument(from url: URL, completion: @escaping (PDFDocument?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil,
                let data = data,
                let document = PDFDocument(data: data) else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            DispatchQueue.main.async {
                completion(document)
            }
        }
        task.resume()
    }
}
