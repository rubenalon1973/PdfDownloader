//
//  Strings.swift
//  MyPdfDownloader
//
//  Created by Ruben Alonso on 18/6/23.
//

import Foundation


extension String {
    var localize: String {
        return NSLocalizedString(self, comment: "")
    }
}

struct Strings {
    enum HomeStrings: String {
        case mainTitle = "Home_Title"
        case insertUrl = "Home_Insert_Url"
        case insertName = "Home_Insert_Name"
        case texfieldInsertUrl = "Home_Texfield_Url"
        case texfieldInsertName = "Home_Texfield_Name"
        case downloadPdf = "Home_Download_Pdf"
        case alertWrong = "Home_Alert_Wrong"
        case alertDownloadPdf = "Home_Alert_DownloadPdf"
        case buttonVisualize = "Home_Button_Visualize"
        case textOpenFile = "Home_Text_OpenFile"
        case errorMessage = "Home_Error_Message"
    }
}
