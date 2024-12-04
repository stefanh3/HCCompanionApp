//
//  RewardsView.swift
//  CompanionApp
//
//  Created by Stefan Hofmann on 13/9/2024.
//

import SwiftUI

struct RewardsView: View {
    
    //This variable keeps track of when to go back to the authentication screen. This is because this screen is triggered through a navigation stack, and I'm not using the vanilla back button
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            NavigationViewHeader(dismissAction: dismiss, screenName: "Rewards", dictationScript: "These are all of the prizes you have gotten so far for continuing your health journey")
            ScrollView() {
                RewardItem(rewardName: "Kangaroo", rewardDescription: "For completing your first healthy habit.", rewardBadge: "KangarooBadge", isAchieved: true)
                RewardItem(rewardName: "Goanna", rewardDescription: "For completing 5 healthy habits.", rewardBadge: "GoannaBadge", isAchieved: true)
                Text("FUTURE ACHIEVEMENTS: ")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.custom("VarelaRound-Regular", size: 15))
                    .padding(.leading, 5)
                    .padding(.top, 10)
                RewardItem(rewardName: "Eagle", rewardDescription: "For completing 10 healthy habits.", rewardBadge: "EagleBadge", isAchieved: false)
                RewardItem(rewardName: "Person", rewardDescription: "For completing 20 healthy habits.", rewardBadge: "PersonBadge", isAchieved: false)
            }
            .padding(.horizontal, 25)
           
        }
        .navigationBarBackButtonHidden(true)
        .background(Color.beachSand)
        .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .top)
    }
}

struct RewardItem: View {
    let rewardName: String
    let rewardDescription: String
    let rewardBadge: String
    let isAchieved: Bool
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .foregroundStyle(Color.white)
                .padding(.leading, 40)
                .padding(.vertical, 18)
            VStack(alignment: .leading) {
                Text(rewardName)
                    .font(.custom("VarelaRoundBold-Bold", size: 30))
                    .foregroundStyle(Color.charcoal)
                Text(rewardDescription)
                    .font(.custom("VarelaRound-Regular", size: 14))
                    .foregroundStyle(Color.charcoal)
            }
            .padding(.leading, 145)
            Image(rewardBadge)
                .resizable()
                .frame(width: 130, height: 130, alignment: .leading)
                .saturation(isAchieved ? 1 : 0) //This is a ternary operator, is isAchieved is true, the saturation is 1, otherwise saturation is 0.
        }
    }
}

#Preview {
    RewardsView()
}
