//
//  HomeTeamView.swift
//  ftvPoints Watch App
//
//  Created by Eduardo Ferreira on 3/9/23.
//

import SwiftUI

struct HomeTeamView: View {
    
    @State var player1: String = ""
    @State var player2: String = ""
    @State var finishHomeTeam: Bool = false
    @State var homePointsHTV: Int = 0
    @State var awayPointsHTV: Int = 0

    var body: some View {
        NavigationView{
            VStack {
                
                //label home team
                Text("HOME TEAM:").font(
                    .system(size: 14).weight(.bold))
                .padding(EdgeInsets(top: 20, leading: 5, bottom: 0, trailing: 0))
                .frame(maxWidth: .infinity,alignment: .leading)
                .foregroundColor(.orange)
                
                //textfield player1
                TextField("Name of player 1", text: $player1).disableAutocorrection(true)
                
                //textfield player2
                TextField("Name of player 2", text: $player2).disableAutocorrection(true)
                    .frame(alignment: .leading)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                
                //next button
                NavigationLink(destination: AwayTeamView(player1a: player1, player2a: player2, homePointsATV: homePointsHTV, awayPointsATV: awayPointsHTV), isActive: self.$finishHomeTeam) {
                    EmptyView()
                }.disabled(true).frame(height: 0).hidden()
                Button("Next") {
                    self.finishHomeTeam = true
                }.foregroundColor(.orange)
            }
        }
    }
}
    
struct HomeTeamView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTeamView()
    }
}
