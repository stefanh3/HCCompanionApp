//
//  ContentView.swift
//  CompanionApp
//
//  Created by Stefan Hofmann on 29/8/2024.
//  This file mainly controls the screen switching mechanisms

import SwiftUI

public enum AvailableViews {
    case scanQR
    case explanation
    case authentication
    case home
}

struct ContentView: View {
    
    //This variable dictates which view gets shown on the screen, according to the values in the enum below.
    @State private var viewBeingShown: AvailableViews = .scanQR
    
    var body: some View {
        switch viewBeingShown {
        case .scanQR:
            ScanQRView(viewBeingShown: $viewBeingShown)
        case .explanation:
            ExplanationView(viewBeingShown: $viewBeingShown)
        case .authentication:
            AuthenticationView(viewBeingShown: $viewBeingShown)
        case .home:
            HomeView(viewBeingShown: $viewBeingShown)
        }
    }
}

#Preview {
    ContentView()
}
