//
//  AuthenticationView.swift
//  CompanionApp
//
//  Created by Stefan Hofmann on 6/9/2024.
//

import SwiftUI

struct AuthenticationView: View {
    
    @Binding var viewBeingShown: AvailableViews
    
    var body: some View {
        NavigationStack {
            GeometryReader { screenSize in
                VStack {
                    SetupHeaderView(viewBeingShown: $viewBeingShown, screenName: "Keep your data extra secret", dictationScript: "lol")
                        .frame(maxWidth: screenSize.size.width)
                    VStack {
                        
                        //Picture Password Button
                        NavigationLink {
                            PicturePasswordView()
                        } label: {
                            HStack{
                                Image(systemName: "face.smiling.fill")
                                    .resizable()
                                    .foregroundStyle(Color.charcoal)
                                    .frame(width: 60, height: 60)
                                    .padding(.leading, 13)
                                Text("Create a Picture Password")
                                    .font(.custom("VarelaRoundBold-Bold", size: 31))
                                    .foregroundStyle(Color.charcoal)
                                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                                    .padding(.leading, 20)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundStyle(Color.charcoal)
                            }
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                            .padding(15)
                            .background(Color.beachSand)
                            .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
                            
                        }
                        
                        //FaceID Button
                        NavigationLink {
                            PicturePasswordView()
                        } label: {
                            HStack{
                                Image(systemName: "face.smiling.fill")
                                    .resizable()
                                    .foregroundStyle(Color.charcoal)
                                    .frame(width: 60, height: 60)
                                    .padding(.leading, 13)
                                VStack(alignment: .leading) {
                                    Text("Face ID")
                                        .font(.custom("VarelaRoundBold-Bold", size: 31))
                                        .foregroundStyle(Color.charcoal)
                                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                                    Text("Anyone who can open your phone will be able to to open this app.")
                                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                                        .font(.custom("VarelaRound-Regular", size: 17))
                                        .foregroundStyle(Color.charcoal)
                                }
                                .padding(.leading, 20)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundStyle(Color.charcoal)
                            }
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                            .padding(15)
                            .background(Color.beachSand)
                            .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
                        }
                            
                        //Number PIN Button
                        NavigationLink {
                            PicturePasswordView()
                        } label: {
                            HStack{
                                Image(systemName: "face.smiling.fill")
                                    .resizable()
                                    .foregroundStyle(Color.charcoal)
                                    .frame(width: 60, height: 60)
                                    .padding(.leading, 13)
                                VStack(alignment: .leading) {
                                    Text("Numbers")
                                        .font(.custom("VarelaRoundBold-Bold", size: 31))
                                        .foregroundStyle(Color.charcoal)
                                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                                    Text("You will need remember 4 numbers to get into the app.")
                                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                                        .font(.custom("VarelaRound-Regular", size: 17))
                                        .foregroundStyle(Color.charcoal)
                                }
                                .padding(.leading, 20)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundStyle(Color.charcoal)
                            }
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                            .padding(15)
                            .background(Color.beachSand)
                            .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
                        }
                        
                        //No Password
                        Button {
                            viewBeingShown = .home
                        } label: {
                            HStack{
                                Image(systemName: "xmark.circle.fill")
                                    .resizable()
                                    .foregroundStyle(Color.redOchre)
                                    .frame(width: 40, height: 40)
                                    .padding(.leading, 13)
                                Text("No Password")
                                    .font(.custom("VarelaRoundBold-Bold", size: 31))
                                    .foregroundStyle(Color.charcoal)
                                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                                    .padding(.leading, 15)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundStyle(Color.charcoal)
                            }
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                            .padding(15)
                            .background(Color.beachSand)
                            .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
                        }
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    
                    
                }
                .background(Color.hotSun)
                .frame(maxHeight: .infinity, alignment: .top)
            }
        }
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    @State static var viewBeingShown: AvailableViews = .authentication
    
    static var previews: some View {
        AuthenticationView(viewBeingShown: $viewBeingShown)
    }
}
