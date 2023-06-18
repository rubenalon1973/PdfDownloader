//
//  Strings.swift
//  PdfDownloader
//
//  Created by Ruben Alonso on 18/6/23.
//

import Foundation


extension String {
    var localize: String {
        return NSLocalizedString(self, comment: "")//lee string q hay en "localizable", y self es el texto elegido
    }
}

struct Strings {
    enum HomeStrings: String {
        case mainTitle = "Home_Title"
        case insertUrl = "Home_Insert"
    }
}
