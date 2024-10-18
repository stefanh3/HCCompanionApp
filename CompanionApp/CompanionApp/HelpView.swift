//
//  HelpView.swift
//  CompanionApp
//
//  Created by Stefan Hofmann on 13/9/2024.
//

import SwiftUI

struct HelpView: View {
    
    //This variable keeps track of when to go back to the authentication screen. This is because this screen is triggered through a navigation stack, and I'm not using the vanilla back button
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            NavigationViewHeader(dismissAction: dismiss, screenName: "Medical Help", dictationScript: "If you have any health worries, you should call one of these numbers")
            ScrollView {
                HelpButton(subTitle: "NEED TO SEE DOCTOR?", title: "PAMS", description: "Aboriginal health service in Pilbara", colour: Color.hotSun, foregroundColour: Color.charcoal, image:
                    Image("PamsLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                )
                HelpButton(subTitle: "HEALTH WORRY?", title: "HEALTH DIRECT", description: nil, colour: Color.hotSun, foregroundColour: Color.charcoal, image:
                            Image(systemName: "phone.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50)
                    .foregroundStyle(Color.charcoal)
                )
                HelpButton(subTitle: "DEPRESSED?", title: "13 YARN", description: "Mental health assistance for mob.", colour: Color.hotSun, foregroundColour: Color.charcoal, image:
                            Image(systemName: "phone.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50)
                    .foregroundStyle(Color.charcoal)
                )
                HelpButton(subTitle: "EMERGENCY?", title: "000", description: "For very bad health worries.", colour: Color.redOchre, foregroundColour: Color.beachSand, image:
                            Image(systemName: "cross.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50)
                    .foregroundStyle(Color.beachSand)
                )
            }
            .padding(.horizontal, 20)
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .background(Color.beachSand)
    }
}

struct HelpButton<Content: View>: View {
    let subTitle: String
    let title: String
    let description: String?
    let colour: Color
    let foregroundColour: Color
    let image: Content
    
    var body: some View {
        Button {
            print("I was pressed!")
        } label: {
            HStack {
                image
                    .frame(maxWidth: 80)
                VStack(alignment: .leading) {
                    Text(subTitle)
                        .font(.custom("VarelaRound-Regular", size: 15))
                        .foregroundStyle(foregroundColour)
                    Text(title)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        .font(.custom("VarelaRoundBold-Bold", size: 35))
                        .foregroundStyle(foregroundColour)
                    if let description = description {
                        Text(description)
                            .font(.custom("VarelaRound-Regular", size: 17))
                            .foregroundStyle(foregroundColour)
                            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                    }
                }
                .frame(maxWidth: .infinity)
                Image(systemName: "chevron.right")
                    .resizable()
                    .frame(width: 15, height: 30)
                    .foregroundStyle(foregroundColour)
                    .padding(.leading, 5)
            }
            .padding(15)
            .background(colour)
            .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
        }
    }
}

#Preview {
    HelpView()
}
