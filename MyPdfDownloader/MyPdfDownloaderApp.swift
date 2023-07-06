//
//  MyPdfDownloaderApp.swift
//  MyPdfDownloader
//
//  Created by Ruben Alonso on 18/6/23.
//

import SwiftUI

@main
struct MyPdfDownloaderApp: App {
    var body: some Scene {
        WindowGroup {
            PdfDownloadView()
                .preferredColorScheme(.dark)
        }
    }
}
