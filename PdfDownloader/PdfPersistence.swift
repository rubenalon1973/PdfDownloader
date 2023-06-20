//
//  PdfPersistence.swift
//  PdfDownloader
//
//  Created by Ruben Alonso on 19/6/23.
//

import Foundation

enum DownloadErrors: String, Error {
    case noURLFound = "URL not found"
    case pdfNameAlreadyExist = "The name you choose already exists"
    case genericError = "Generic error"
    case invalidURL = "Invalid URL"
}

final class PdfPersistence {
    static let shared = PdfPersistence()
    
    private init(){}
    
    private func getDocumentDirectory() -> URL? {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
    }
    
    func downloadPdf(url: URL, pdfName: String) async throws {
        
        guard let documentDirectoryURL = getDocumentDirectory() else { throw DownloadErrors.noURLFound }
        
        let destinationURL = documentDirectoryURL.appendingPathComponent(pdfName, conformingTo: .pdf)
        
        
        do {
            let (tempURL, response) = try await URLSession.shared.download(from: url)
            guard let urlResponse = response as? HTTPURLResponse else { return }
            
            switch urlResponse.statusCode {
            case 200...299:
                do {
                    try FileManager.default.moveItem(at: tempURL, to: destinationURL)
                    print("Archivo guarda en: \(destinationURL)")
                } catch {
                    print("Error al guardar el archivo: \(error)")
                    throw DownloadErrors.pdfNameAlreadyExist
                }
            case 400...450:
                throw DownloadErrors.noURLFound
            default:
                throw DownloadErrors.genericError
            }
        } catch {
            //            print(error)
            throw DownloadErrors.invalidURL
        }
    }
}
