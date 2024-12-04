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
    @State var daysUntilAppointment = 1

    //Speech Synthesis Components
    let speechSynthesiser = AVSpeechSynthesizer()
    let utterance = AVSpeechUtterance(string: "This is the home screen")
    
    var body: some View {
        GeometryReader { content in
            NavigationStack {
                VStack {
                    
                    //The expanded header today or tomorrow appointment
                    if daysUntilAppointment == 1 || daysUntilAppointment == 0 {
                        VStack(alignment: .leading) {
                            HStack {
                                Button {
                                    speechSynthesiser.speak(utterance)
                                } label: {
                                    Label("Listen", systemImage: "ear")
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 7)
                                        .background(Color.charcoal)
                                        .foregroundColor(Color.beachSand)
                                        .cornerRadius(25)
                                        .font(.custom("VarelaRound-Regular", size: 18))
                                }
                                .clipShape(RoundedRectangle(cornerRadius: 100.0))
                                Spacer()
                                Button {
                                    daysUntilAppointment = 5
                                } label: {
                                    Image(systemName: "gearshape")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .padding(10)
                                        .background(Color.charcoal)
                                        .foregroundColor(Color.beachSand)
                                }
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            }
                            .frame(height: content.size.height * 0.05)
                            .padding(.bottom, 10)
                            Text("Hi, Monique")
                                .font(.custom("VarelaRoundBold-Bold", size: 25))
                                .foregroundStyle(Color.charcoal)
                            if daysUntilAppointment == 0 {
                                Text("Doctor Tomorrow")
                                    .font(.custom("VarelaRound-Regular", size: 32))
                                    .foregroundStyle(Color.redOchre)
                            } else {
                                Text("Doctor Today")
                                    .font(.custom("VarelaRound-Regular", size: 32))
                                    .foregroundStyle(Color.redOchre)
                            }
                        }
                        .padding(.horizontal, 20)
                        
                    //The compact header when appointment is not today or tomorrow
                    } else {
                        HStack {
                            Text("Hi, Monique")
                                .font(.custom("VarelaRoundBold-Bold", size: 30))
                                .padding(.leading, 25)
                            Spacer()
                            Button {
                                daysUntilAppointment = 1
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
                    }
                    
                    ScrollView(.vertical) {
                        if daysUntilAppointment == 1 || daysUntilAppointment == 0 {
                            AppointmentTime()
                                .padding(.horizontal, 15)
                            AppointmentLocation()
                                .padding(.horizontal, 15)
                            AppointmentCall()
                                .padding(.horizontal, 15)
                            AppointmentPackingList()
                                .padding(.horizontal, 15)
                        } else {
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
                        }
                        
                        NavigationButtons()
                            .padding(.horizontal, 15)
                        VideoLibrary()
                            .padding(.horizontal, 15)
                    }
//                    .padding(.horizontal, 15)
                }
                .background(Color.beachSand)
            }
        }
    }
}
struct AppointmentTime: View {
    var body: some View {
        HStack(spacing: 10){
            Spacer()
            Image(systemName: "sunrise.fill")
                .resizable()
                .foregroundStyle(Color.yellow)
                .frame(width: 55, height: 40)
                .aspectRatio(contentMode: .fit)
            Text("12:30pm")
                .font(.custom("VarelaRound-Regular", size: 35))
                .foregroundStyle(Color.charcoal)
            Spacer()
        }
        .padding(.vertical, 11)
        .background {
            LinearGradient(colors: [.gradientBottom, .gradientTop], startPoint: .bottom, endPoint: .top)
        }
        .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
    }
}

struct AppointmentLocation: View {
    var body: some View {
        ZStack(alignment: .trailing) {
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .foregroundStyle(Color.white)
            VStack(alignment: .leading){
                Image(.newmanPAMS)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 130)
                    .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
                HStack{
                    Image(systemName: "location.fill")
                    Text("PAMS Newman")
                        .font(.custom("VarelaRound-Regular", size: 18))
                }
                .padding(.horizontal, 23)
                .padding(.bottom, 9)
                .padding(.top, 3)
                
            }
            Image(.pamsLogoColour)
                .resizable()
                .frame(width: 120, height: 90)
                .padding(15)
                .background(Color.white)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .padding(.trailing, 20)
        }
    }
}

struct AppointmentCall: View {
    var body: some View {
        HStack(spacing: 0) {
            Spacer()
            Image(systemName: "phone.fill")
                .resizable()
                .foregroundStyle(Color.charcoal)
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 55)
            Image(.pamsLogoColour)
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .frame(width: 100, height: 55)
            Spacer()
            Image(systemName: "chevron.right.circle.fill")
                .padding(.trailing, 10)
        }
        .padding(.vertical, 15)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
    }
}

struct AppointmentPackingList: View {
    var body: some View {
        VStack {
            Text("BRING WITH YOU:")
                .font(.custom("VarelaRound-Regular", size: 12))
            HStack(spacing: 10) {
                Spacer()
                Image(systemName: "pills.fill")
                    .padding(7)
                    .foregroundStyle(Color.beachSand)
                    .background(Color.redOchre)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                Text("Pills")
                    .font(.custom("VarelaRound-Regular", size: 30))
                    .padding(.trailing, 15)
                Image(systemName: "doc.fill")
                    .padding(7)
                    .foregroundStyle(Color.beachSand)
                    .background(Color.redOchre)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                Text("Papers")
                    .font(.custom("VarelaRound-Regular", size: 30))
                Spacer()
            }
        }
        .padding(10)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
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
            NavigationButton(icon: "brain.head.profile.fill", name: "Data", width: 30, height: 30, padding: 15, destination: DataView())
                .padding(.trailing, 2)
            NavigationButton(icon: "star.fill", name: "Rewards", width: 33, height: 30, padding: 15, destination: RewardsView())
//                .padding(.horizontal, 2)
            NavigationButton(icon: "cross.case.fill", name: "Help", width: 40, height: 32, padding: 15, destination: HelpView())
//                .padding(.horizontal, 2)
            NavigationButton(icon: "doc.fill", name: "Papers", width: 26, height: 32, padding: 17, destination: PapersView())
            NavigationButton(icon: "person.2.fill", name: "Checkups", width: 45, height: 30, padding: 15, destination: CheckupView())
            
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
//                    .padding(.horizontal, 1)
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
