//
//  AwayTeamView.swift
//  ftvPoints Watch App
//
//  Created by Eduardo Ferreira on 3/9/23.
//

import SwiftUI

struct AwayTeamView: View {
    
    //coredata
    @Environment(\.managedObjectContext) var managedObjContext

    @State var player1a: String = ""
    @State var player2a: String = ""
    @State var player3: String = ""
    @State var player4: String = ""
    @State var finishAwayTeam: Bool = false
    @State var homePointsATV: Int = 0
    @State var awayPointsATV: Int = 0
    
    var body: some View {
        NavigationView {
            VStack {
                
                //label away team
                Text("AWAY TEAM:").font(
                    .system(size: 14).weight(.bold))
                .padding(EdgeInsets(top: 20, leading: 5, bottom: 0, trailing: 0))
                .foregroundColor(.purple).frame(alignment: .leading).padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 60))
                
                //textfield player3
                TextField("Name of player 3", text: $player3)
                
                //textfield player4
                TextField("Name of player 4", text: $player4)
                    .frame(alignment: .leading)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                
                //destination listhistoryview
                NavigationLink(destination: ListHistoryView(), isActive: self.$finishAwayTeam) {
                    EmptyView()
                }.disabled(true).frame(height: 0).hidden()
                
                //button next
                Button("Next") {
                    
                    //add match info to coredata
                    ControleData().addJogo(name1: player1a, name2: player2a, name3: player3, name4: player4, pointshome: homePointsATV, pointsaway: awayPointsATV, context: managedObjContext)
                    self.finishAwayTeam = true
                }.foregroundColor(.purple)
            }
        }
    }
    
    struct AwayTeamView_Previews: PreviewProvider {
        static var previews: some View {
            AwayTeamView()
        }
    }
}
