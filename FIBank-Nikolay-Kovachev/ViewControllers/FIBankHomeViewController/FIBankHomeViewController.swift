//
//  FIBankHomeViewController.swift
//  FIBank-Nikolay-Kovachev
//
//  Created by KNG on 16.04.24.
//

import UIKit
import PDFKit

class FIBankHomeViewController: UIViewController {
    @IBOutlet weak var tariffBGButton: UIButton!
    @IBOutlet weak var tariffENButton: UIButton!
    @IBOutlet weak var bulletinBGButton: UIButton!
    @IBOutlet weak var bulletinENButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tappedButton(_ sender: UIButton) {
        if let pdfPresentationViewController = UIStoryboard.main.instantiateViewController(identifier: "PdfPresentationViewController") as? PdfPresentationViewController,
           let pdfUrl = PdfUrl[sender.tag] {
            pdfPresentationViewController.pdfUrl = pdfUrl
            self.navigationController?.pushViewController(pdfPresentationViewController, animated: true)
        }
    }
}

