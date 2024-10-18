//
//  CheckupView.swift
//  CompanionApp
//
//  Created by Stefan Hofmann on 13/9/2024.
//

import SwiftUI

struct CheckupView: View {
    
    //This variable keeps track of when to go back to the authentication screen. This is because this screen is triggered through a navigation stack, and I'm not using the vanilla back button
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack() {
            NavigationViewHeader(dismissAction: dismiss, screenName: "Checkups", dictationScript: "These are your upcoming checkups at the clinic")
            ScrollView {
                Text("COMING UP: ")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.custom("VarelaRound-Regular", size: 15))
                    .padding(.leading, 5)
                AppointmentItem(imageName: "GoannaOval", appointmentTitle: "Follow Up Screening", appointmentTime: "4:30pm", appointmentDate: "30th July 2024", appointmentLocation: "Goanna Oval, Newman", isFuture: true)
                Text("IN THE PAST: ")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.custom("VarelaRound-Regular", size: 15))
                    .padding(.leading, 5)
                    .padding(.top, 20)
                AppointmentItem(imageName: "GoannaOval", appointmentTitle: "Follow Up Screening", appointmentTime: "4:30pm", appointmentDate: "30th July 2024", appointmentLocation: "Goanna Oval, Newman", isFuture: false)
            }
            .padding(.horizontal, 25)
        }
        .navigationBarBackButtonHidden(true)
        .background(Color.beachSand)
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

struct AppointmentItem: View {
    let imageName: String
    let appointmentTitle: String
    let appointmentTime: String
    let appointmentDate: String
    let appointmentLocation: String
    let isFuture: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .frame(maxHeight: 120)
                .clipped()
                .saturation(isFuture ? 1 : 0)
            VStack(alignment: .leading, spacing: 3) {
                Text(appointmentTitle)
                    .font(.custom("VarelaRoundBold-Bold", size: 24))
                HStack {
                    Image(systemName: "clock.fill")
                    Text(appointmentTime)
                        .font(.custom("VarelaRound-Regular", size: 16))
                }
                HStack {
                    Image(systemName: "calendar")
                    Text(appointmentDate)
                        .font(.custom("VarelaRound-Regular", size: 16))

                }
                HStack{
                    Image(systemName: "location.fill")
                    Text(appointmentLocation)
                        .font(.custom("VarelaRound-Regular", size: 16))

                }
            }
            .padding(.horizontal, 15)
            .padding(.top, 5)
            .padding(.bottom, 15)
        }
        .foregroundStyle(Color.beachSand)
        .background(isFuture ? Color.redOchre:Color.gray)
        .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
    }
}

#Preview {
    CheckupView()
}
