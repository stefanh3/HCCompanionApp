//
//  NavigationViewHeader.swift
//  CompanionApp
//
//  Created by Stefan Hofmann on 9/9/2024.
//

import SwiftUI
import AVFoundation


struct JourneyStripNavigationView: View {
    //This variable controls with the parent view this header is attached to, and allows the back button to back out of the navigation view
    let dismissAction: DismissAction
    
    var body: some View {
        ZStack {
            Image("HeaderStrip")
                .resizable()
                .frame(width: 250, height: 100)
            Button {
                dismissAction()
            } label: {
                Label("Back", systemImage: "chevron.backward.circle.fill")
                    .padding(13)
                    .background(Color.charcoal)
                    .foregroundColor(Color.beachSand)
                    .cornerRadius(25)
                    .font(.custom("VarelaRoundBold-Bold", size: 21))
            }
            .padding(.trailing, 80)
        }
    }
}


struct NavigationViewHeader: View {
    //This variable controls with the parent view this header is attached to, and allows the back button to back out of the navigation view
    let dismissAction: DismissAction
    var screenName: String
    var dictationScript: String
    
    var body: some View {
        
        //Speech Synthesis Components
        let speechSynthesiser = AVSpeechSynthesizer()
        let utterance = AVSpeechUtterance(string: dictationScript)
        
        VStack(spacing: 0) {
            HStack {
                JourneyStripNavigationView(dismissAction: dismissAction)
                Spacer()
                Button {
                    speechSynthesiser.speak(utterance)
                } label: {
                    Image(systemName: "ear")
                        .resizable()
                        .frame(width: 25, height: 35)
                        .padding(15)
                        .background(Color.charcoal)
                        .foregroundColor(Color.beachSand)
                }
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .padding(.trailing, 35)
                
            }
            Text(screenName)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .padding(.leading, 30)
                .font(.custom("DeliciousHandrawn-Regular", size: 50))
                .foregroundStyle(Color.charcoal)
        }
        .padding(.bottom, 20)
    }
}

//#Preview {
//    NavigationViewHeader(dismissAction: {}, screenName: "Test Screen", dictationScript: "This is still a test")
//}
