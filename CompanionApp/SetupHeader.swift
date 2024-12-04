//
//  SetupHeader.swift
//  CompanionApp
//
//  Created by Stefan Hofmann on 6/9/2024.
//

import SwiftUI
import AVFoundation

//This view is just the journey strip with the buttons, which then gets placed into the below SetupHeaderView()
struct JourneyStrip: View {
    @Binding var viewBeingShown: AvailableViews
    
    var body: some View {
        ZStack {
            Image("HeaderStrip")
                .resizable()
                .frame(width: 270, height: 98)
            HStack {
                Button {
                    viewBeingShown = .scanQR
                    } label: {
                        Image(systemName: "qrcode")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding(15)
                            .background(Color.shallowSea)
                            .foregroundStyle(Color.white)
                }
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .padding(.leading, 80)
                Spacer()
                Button {
                    viewBeingShown = .explanation
                    } label: {
                        Image(systemName: "hand.raised.fill")
                            .resizable()
                            .frame(width: 29, height: 38)
                            .padding(15)
                            .background(Color.shallowSea)
                            .foregroundStyle(Color.white)
                }
                .clipShape(Circle())
                Spacer()
                Button {
                    viewBeingShown = .authentication
                    } label: {
                        Image(systemName: "lock.fill")
                            .resizable()
                            .frame(width: 23, height: 32)
                            .padding(17)
                            .background(Color.shallowSea)
                            .foregroundStyle(Color.white)
                }
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .padding(.trailing, 100)
            }
                
        }
    }
}

struct SetupHeaderView: View {
    @Binding var viewBeingShown: AvailableViews
    var screenName: String
    var dictationScript: String
    
    var body: some View {
        
        //Speech Synthesis Components
        let speechSynthesizer = AVSpeechSynthesizer()
        let utterance = AVSpeechUtterance(string: dictationScript)
        
        VStack(spacing: 0) {
            HStack {
                JourneyStrip(viewBeingShown: $viewBeingShown)
                Button {
                    speechSynthesizer.speak(utterance)
                } label: {
                    Image(systemName: "ear")
                        .resizable()
                        .frame(width: 25, height: 35)
                        .padding(15)
                        .background(Color.charcoal)
                        .foregroundStyle(Color.beachSand)
                }
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .padding(.trailing, 90)
            }
            Text(screenName)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
                .font(.custom("DeliciousHandrawn-Regular", size: 50))
        }
    }
}

struct SetupHeader_Previews: PreviewProvider {
    @State static var viewBeingShown: AvailableViews = .scanQR
    
    static var previews: some View {
        SetupHeaderView(viewBeingShown: $viewBeingShown, screenName: "Scan QR Code", dictationScript: "This will be read out to the user")
    }
}

