//
//  PdfDownloadView.swift
//  PdfDownloader
//
//  Created by Ruben Alonso on 18/6/23.
//

import SwiftUI


struct PdfDownloadView: View {
    
    @State var textFieldText = ""

    var body: some View {
        VStack {
            Text(Strings.HomeStrings.mainTitle.rawValue.localize)
                .font(.largeTitle)
                .bold()
                .padding(.bottom, 100)
            Text(Strings.HomeStrings.insertUrl.rawValue.localize)
                .font(.headline)
//            mirar texfield book masterview y cambiar formatos
            TextField("Insert URL", text: $textFieldText)
                .textFieldStyle(.roundedBorder)
            Spacer()
            

        }
        .padding()
    }
}

struct PdfDownloadView_Previews: PreviewProvider {
    static var previews: some View {
        PdfDownloadView()
    }
}
