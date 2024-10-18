//
//  PicturePasswordView.swift
//  CompanionApp
//
//  Created by Stefan Hofmann on 6/9/2024.
//

import SwiftUI

struct PicturePasswordView: View {
    
    //This variable keeps track of when to go back to the authentication screen. This is because this screen is triggered through a navigation stack, and I'm not using the vanilla back button
    @Environment(\.dismiss) var dismiss
    
    @State var selectedAnimal = "HoneyAnt"
    @State var selectedColour: Color = .red
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    let animalImages = ["Cockatoo", "Eagle", "Goanna", "HoneyAnt", "Kangaroo", "Snake"]
    let animalColours = [Color.blue, Color.red, Color.green, Color.pink]
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                NavigationViewHeader(dismissAction: dismiss, screenName: "Create your picture password", dictationScript: "Here you can create your own picture password")
                VStack {
                    Image(selectedAnimal)
                        .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                        .foregroundColor(selectedColour)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(0..<4) { index in
                                ColourSelectorButton(colour: animalColours[index], selectedColour: $selectedColour)
                            }
                        }
                    }
                    .frame(height: geo.size.height * 0.07)
                    LazyVGrid(columns: columns, spacing: 0) {
                        ForEach(0..<6) { index in
                            Button {
                                selectedAnimal = animalImages[index]
                                print(selectedAnimal)
                            } label: {
                                Image(animalImages[index])
                                    .resizable()
                                    .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    Button {
                        print("I will go back")
                    } label: {
                        Label("Next", systemImage: "chevron.backward.circle.fill")
                            .padding(13)
                            .background(Color.redOchre)
                            .foregroundColor(Color.beachSand)
                            .cornerRadius(25)
                            .font(.custom("VarelaRoundBold-Bold", size: 21))
                    }
                    Spacer()
                }
                .padding(.horizontal, 25)
            }
            .navigationBarBackButtonHidden(true)
            .background(Color.hotSun)
        }
    }
}

struct ColourSelectorButton: View {
    let colour: Color
    @Binding var selectedColour: Color
    
    var body: some View {
        Button {
            selectedColour = colour
        } label: {
            Circle()
                .fill(colour)
        }
    }
}

#Preview {
    PicturePasswordView()
}
