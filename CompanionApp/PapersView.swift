//
//  PapersView.swift
//  CompanionApp
//
//  Created by Stefan Hofmann on 27/11/2024.
//

import SwiftUI

struct PapersView: View {
    
    //This variable keeps track of when to go back to the authentication screen. This is because this screen is triggered through a navigation stack, and I'm not using the vanilla back button
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            NavigationViewHeader(dismissAction: dismiss, screenName: "My Papers", dictationScript: "This screen contains all of the pictures of papers that you have taken.")
            VStack {
                PictureCollection(date: "Wed 25th Sept", images: ["GoannaOval", "WashingHands"])
                Spacer()
            }
            .padding(.horizontal, 25)
        }
        .background(Color.beachSand)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    PapersView()
}

struct PictureCollection: View {
    let date: String
    let images: [String]
    
    let gridItems = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack(spacing: 25) {
            HStack(spacing: 10) {
                Text("Wed 25th Sept")
                Rectangle()
                    .frame(height: 1)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            LazyVGrid(columns: gridItems) {
                ForEach(images, id: \.self) { image in
                    Image(image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
                }
            }
        }
    }
}
