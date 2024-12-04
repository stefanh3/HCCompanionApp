//
//  DataView.swift
//  CompanionApp
//
//  Created by Stefan Hofmann on 13/9/2024.
//

import SwiftUI

struct DataView: View {
    
    //This variable keeps track of when to go back to the authentication screen. This is because this screen is triggered through a navigation stack, and I'm not using the vanilla back button
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            NavigationViewHeader(dismissAction: dismiss, screenName: "My Data", dictationScript: "This is all of the knowledge that this app has about you, you may choose to show this to any staff who are helping you.")
            GeometryReader { content in
                VStack(spacing: 12) {
                    Button {
                        print("I have been pressed")
                    } label: {
                        VStack(alignment: .leading) {
                            Image(systemName: "person.text.rectangle")
                                .resizable()
                                .frame(width: 67, height: 50)
                            Spacer()
                            HStack(alignment: .bottom) {
                                Text("Personal Information")
                                    .font(.custom("VarelaRoundBold-Bold", size: 28))
                                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                                    .offset(y: 5)
                                Spacer()
                                Image(systemName: "chevron.right.circle.fill")
                                    .frame(alignment: .bottom)
                            }
                        }
                        .foregroundStyle(Color.charcoal)
                        .frame(height: content.size.height * 0.25)
                        .padding(20)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    }
                    
                    //This HStack contains the two middle buttons next to each other
                    HStack(spacing: 12){
                        Button {
                            print("I have been pressed")
                        } label: {
                            VStack(alignment: .leading) {
                                Text("Medication List")
                                    .padding(.leading, 12)
                                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                                    .font(.custom("VarelaRoundBold-Bold", size: 20))
                                    .padding(.horizontal, 7)
                                Spacer()
                                HStack(alignment: .bottom) {
                                    Image(systemName: "pills")
                                        .resizable()
                                        .frame(width: 40, height: 35)
                                    Spacer()
                                    Image(systemName: "chevron.right.circle.fill")
                                        .frame(alignment: .bottom)
                                }
                                .padding(.horizontal, 20)
                            }
                            .foregroundStyle(Color.charcoal)
                            .padding(.vertical, 15)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 25.0))
                        }
                        Button {
                            print("I have been pressed")
                        } label: {
                            VStack(alignment: .leading) {
                                Text("Health Conditions")
                                    .padding(.leading, 12)
                                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                                    .font(.custom("VarelaRoundBold-Bold", size: 20))
                                    .padding(.horizontal, 7)
                                Spacer()
                                HStack(alignment: .bottom) {
                                    Image(systemName: "cross")
                                        .resizable()
                                        .frame(width: 35, height: 35)
                                    Spacer()
                                    Image(systemName: "chevron.right.circle.fill")
                                        .frame(alignment: .bottom)
                                }
                                .padding(.horizontal, 20)
                            }
                            .foregroundStyle(Color.charcoal)
                            .padding(.vertical, 15)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 25.0))
                        }
                    }
                    .frame(height: content.size.height * 0.25)
                    
                    //This VStack contains the two red buttons
                    VStack {
                        Button {
                            print("I was pressed")
                        } label: {
                            HStack {
                                Image(systemName: "square.and.arrow.up.circle.fill")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                Text("Export All\nData")
                                    .font(.custom("VarelaRoundBold-Bold", size: 28))
                                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                                    .padding(.leading, 8)
                                Spacer()
                                Image(systemName: "chevron.right")
                            }
                        }
                        .foregroundStyle(Color.beachSand)
                        .padding(.horizontal, 18)
                        .padding(.vertical, 10)
                        .background(Color.redOchre)
                        .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
                        Button {
                            print("I was pressed")
                        } label: {
                            HStack {
                                Image(systemName: "xmark.circle.fill")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                Text("Delete All\nData")
                                    .font(.custom("VarelaRoundBold-Bold", size: 28))
                                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                                    .padding(.leading, 8)
                                Spacer()
                                Image(systemName: "chevron.right")
                            }
                        }
                        .foregroundStyle(Color.beachSand)
                        .padding(.horizontal, 18)
                        .padding(.vertical, 10)
                        .background(Color.redOchre)
                        .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
                    }
                }
                .padding(.horizontal, 25)
            }

            
        }
        .navigationBarBackButtonHidden(true)
        .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .top)
        .background(Color.beachSand)
    }
}

#Preview {
    DataView()
}
