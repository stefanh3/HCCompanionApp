//
//  ScanQR.swift
//  CompanionApp
//
//  Created by Stefan Hofmann on 29/8/2024.
//

import CodeScanner
import SwiftUI

struct ScanQRView: View {
    
    //This handles the view being shown on screen, which is controlled in the Content View
    @Binding var viewBeingShown: AvailableViews
    
    var body: some View {
        VStack {
            SetupHeaderView(viewBeingShown: $viewBeingShown, screenName: "Scan QR code on medikit", dictationScript: "Point this device toward the QR Code pattern being displayed on the medi kit.")
            CodeScannerView(codeTypes: [.qr], simulatedData: "lol", completion: handleScan)
        }
        .background(Color.hotSun)
    }
    
    func handleScan(result: Result<ScanResult, ScanError>) {
        switch result {
        case .success(let success):
            viewBeingShown = .explanation
        case .failure(let failure):
            print("Scanning Failed A lot")
        }
        print("hello")
    }
}

struct ScanQRView_Previews: PreviewProvider {
    @State static var viewBeingShown: AvailableViews = .scanQR
    
    static var previews: some View {
        ScanQRView(viewBeingShown: $viewBeingShown)
    }
}
