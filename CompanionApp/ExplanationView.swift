//
//  ExplanationView.swift
//  CompanionApp
//
//  Created by Stefan Hofmann on 6/9/2024.
//

import SwiftUI

struct ExplanationView: View {
    
    @Binding var viewBeingShown: AvailableViews
    
    var body: some View {
        VStack {
            SetupHeaderView(viewBeingShown: $viewBeingShown, screenName: "Explanation", dictationScript: "lol")
            Spacer()
        }
        .background(Color.hotSun)
    }
}

struct ExplanationView_Previews: PreviewProvider {
    @State static var viewBeingShown: AvailableViews = .explanation
    
    static var previews: some View {
        ExplanationView(viewBeingShown: $viewBeingShown)
    }
}

