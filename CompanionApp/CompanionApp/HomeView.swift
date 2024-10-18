//
//  HomeVIew.swift
//  CompanionApp
//
//  Created by Stefan Hofmann on 9/9/2024.
//

import SwiftUI
import AVFoundation

struct HomeView: View {
    
    @Binding var viewBeingShown: AvailableViews
    
    //Speech Synthesis Components
    let speechSynthesiser = AVSpeechSynthesizer()
    let utterance = AVSpeechUtterance(string: "This is the home screen")
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Hi, Monique")
                        .font(.custom("VarelaRoundBold-Bold", size: 30))
                        .padding(.leading, 25)
                    Spacer()
                    Button {
                        viewBeingShown = .authentication
                    } label: {
                        Image(systemName: "gearshape")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .padding(12)
                            .background(Color.charcoal)
                            .foregroundColor(Color.beachSand)
                    }
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .padding(2)
                    Button {
                        speechSynthesiser.speak(utterance)
                    } label: {
                        Image(systemName: "ear")
                            .resizable()
                            .frame(width: 20, height: 28)
                            .padding(15)
                            .background(Color.charcoal)
                            .foregroundColor(Color.beachSand)
                    }
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .padding(.trailing, 25)
                }
                ScrollView(.vertical) {
                    ZStack {
                        AppointmentReminder()
                            .padding(.horizontal, 15)
                            .padding(.bottom, 5)
                        Image("MeetingPlace")
                            .resizable()
                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                            .frame(width: 250, height: 250)
                            .offset(x: 160)

                    }
                    HealthyHabits()
                        .padding(.horizontal, 15)
                        .padding(.bottom, 5)
                    NavigationButtons()
                        .padding(.horizontal, 15)
                        .padding(.bottom, 5)
                    VideoLibrary()
                        .padding(.horizontal, 15)
                }
            }
            .background(Color.beachSand)
        }
    }
}

struct AppointmentReminder: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Your next \nappointment is in:")
                        .font(.custom("VarelaRound-Regular", size: 20))
                        .foregroundStyle(Color.charcoal)
                    Text("5 Days")
                        .font(.custom("VarelaRoundBold-Bold", size: 30))
                        .foregroundStyle(Color.redOchre)
                    Text("Friday 20th June.")
                        .font(.custom("VarelaRound-Regular", size: 20))
                        .foregroundStyle(Color.charcoal)
                }
                .padding(.horizontal, 20)
                .padding(.top, 15)
                .padding(.bottom, 10)
                Spacer()
            }
            Image("GoannaOval")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 100)
                .clipped()
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
    }
}

struct HealthyHabits: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("YOUR HEALTHY HABITS:")
                .font(.custom("VarelaRound-Regular", size: 13))
                .padding(.horizontal, 25)
                .padding(.top, 15)
            HealthyHabitButton(buttonText: "Add a cup of veggies to your meal. ")
            HealthyHabitButton(buttonText: "Have a bushwalk with family, lookout for goanna and emu eggs.")
                .padding(.bottom, 10)
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
    }
}

struct HealthyHabitButton: View {
    let buttonText: String
    
    var body: some View {
        Button {
            print("I was pressed")
        } label: {
            HStack {
                Image(systemName: "square")
                Text(buttonText)
                    .font(.custom("VarelaRound-Regular", size: 15))
            }
            .frame(maxWidth: .infinity)
        }
        .padding()
        .background(Color.lightGray)
        .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
        .padding(.horizontal, 15)
    }
}

struct NavigationButtons: View {
    var body: some View {
        HStack(spacing: 1) {
            NavigationButton(icon: "person.2.fill", name: "Checkups", width: 45, height: 30, padding: 15, destination: CheckupView())
//                .padding(.horizontal, 2)
            NavigationButton(icon: "star.fill", name: "Rewards", width: 33, height: 30, padding: 15, destination: RewardsView())
//                .padding(.horizontal, 2)
            NavigationButton(icon: "cross.case.fill", name: "Help", width: 40, height: 32, padding: 15, destination: HelpView())
//                .padding(.horizontal, 2)
            NavigationButton(icon: "brain.head.profile.fill", name: "Data", width: 31, height: 35, padding: 15, destination: DataView())
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 10)
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
    }
}

struct NavigationButton<Content: View>: View {
    let icon: String
    let name: String
    let width: CGFloat
    let height: CGFloat
    let padding: CGFloat
    let destination: Content //Allows a destinatiom view to be passed in
    
    var body: some View {
        NavigationLink {
            destination
        } label: {
            VStack(alignment: .center) {
                Image(systemName: icon)
                    .resizable()
                    .frame(width: width, height: height)
                    .padding(padding)
                    .background(Color.hotSun)
                    .foregroundColor(Color.charcoal)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .padding(.horizontal, 4)
                Text(name)
                    .font(.custom("VarelaRound-Regular", size: 13))
                    .foregroundStyle(Color.charcoal)
            }
        }
    }
}

struct VideoLibrary: View {
    var body: some View {
        let items = Array(0...3)
        let videoTitles = ["Keeping Yourself Clean","What is Sugar Diabates","Going to Hospital Worries","Going to PAMS Worries"]
        let videoPictures = ["WashingHands","Lollies","NewmanHospital","PamsLogo"]
        
        let gridItems = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
        
        VStack {
            LazyVGrid(columns: gridItems, content: {
                ForEach(items, id: \.self) { item in
                    VideoButton(image: videoPictures[item], title: videoTitles[item])
                }
            })
        }
        
        .padding(15)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
    }
}

struct VideoButton: View {
    let image: String
    let title: String
    
    var body: some View {
        Button{
            print("Someone is pressing me!")
        } label: {
            VStack(alignment: .leading) {
                Image(image)
                    .resizable()
//                    .aspectRatio(contentMode: .fill)
                    .frame(height: 120)
                    .clipped()
                VStack(alignment: .leading) {
                    Text("VIDEO")
                        .font(.custom("VarelaRound-Regular", size: 14))
                        .foregroundStyle(Color.beachSand)
//                        .padding(.bottom,1)
                    Text(title)
                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        .font(.custom("VarelaRoundBold-Bold", size: 24))
                        .foregroundStyle(Color.beachSand)
                }
                .padding(.top,4)
                .padding(.horizontal, 12)
                .padding(.bottom, 10)
            }
            .background(Color.shallowSea)
            .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    @State static var viewBeingShown: AvailableViews = .home
    
    static var previews: some View {
        HomeView(viewBeingShown: $viewBeingShown)
    }
}
