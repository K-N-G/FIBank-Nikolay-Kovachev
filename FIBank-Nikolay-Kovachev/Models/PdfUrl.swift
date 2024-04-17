//
//  PdfUrl.swift
//  FIBank-Nikolay-Kovachev
//
//  Created by KNG on 17.04.24.
//

import Foundation

enum PdfUrl: String, CaseIterable {
    case tariffBG = "https://www.fibank.bg/web/files/documents/141/files/Tariff.pdf"
    case tariffEN = "https://www.fibank.bg/web/files/documents/203/files/Tariff_EN.pdf"
    case interestBulletinBG = "https://www.fibank.bg/web/files/documents/142/files/Bulletin.pdf"
    case interestBulletinEN = "https://www.fibank.bg/web/files/documents/204/files/Bulletin_EN.pdf"
    
    static subscript(index: Int) -> PdfUrl? {
        guard index >= 0 && index < allCases.count else {
            return nil
        }
        return allCases[index]
    }
}
