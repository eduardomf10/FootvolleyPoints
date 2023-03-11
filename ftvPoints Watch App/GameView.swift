//
//  GameView.swift
//  ftvPoints Watch App
//
//  Created by Eduardo Ferreira on 3/9/23.
//

import SwiftUI

struct GameView: View {
    
    @State var pointsA = 0
    @State var pointsB = 0
    @State var showingAlert = false
    @State var showEndGameAlert = false
    @State var showEndGameView = false
    @State var sureRestart = false
    @State var customHomeEnd = Text("Home Team: ").font(
        .system(size: 17).weight(.bold))
        .foregroundColor(.orange)
    @State var customAwayEnd = Text("Away Team: ").font(
        .system(size: 17).weight(.bold))
        .foregroundColor(.purple)
    
    //function increment +1 to home team
    func incrementTeamA() {
        
        //add 1
        pointsA += 1
        
        if (pointsA >= 18) {
            
            //2 points difference
            if (pointsA - pointsB >= 2) {
                showEndGameAlert = true
            } else if ((pointsA + pointsB) % 6 == 0) {
                showingAlert = true
            }
        } else if ((pointsA + pointsB) % 6 == 0) {
            showingAlert = true
        }
    }
    
    //function increment +1 to away team
    func incrementTeamB() {
        
        //add 1
        pointsB += 1

        if (pointsB >= 18) {
            
            //2 points difference
            if (pointsB - pointsA >= 2) {
                showEndGameAlert = true
            } else if ((pointsB + pointsA) % 6 == 0) {
                showingAlert = true
            }
        } else if ((pointsB + pointsA) % 6 == 0) {
            showingAlert = true
        }
    }
    
    //start view
    var body: some View {
        NavigationView {
            VStack{
                NavigationLink(destination: HomeTeamView(homePointsHTV: pointsA, awayPointsHTV: pointsB), isActive: self.$showEndGameView) {
                    EmptyView()
                }.disabled(true).frame(height: 0).hidden()
                HStack{
                    
                    //label home
                    Text("HOME:")
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(EdgeInsets(top: 15, leading: 15, bottom: 0, trailing: 0))
                        .font(.system(size: 16).weight(.bold))
                        .foregroundColor(.orange)
                    
                    //home team points
                    Text("\(pointsA)")
                        .font(
                            .system(size: 16).weight(.heavy))
                        .foregroundStyle(.orange.gradient)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(EdgeInsets(top: 15, leading: -8, bottom: 0, trailing: 0))
                }
                
                //button + home team points
                Button("+", action: incrementTeamA)
                    .frame(width: .infinity, height: 35)
                    .cornerRadius(25)
                    .foregroundColor(.orange)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                    .alert(isPresented: $showingAlert){
                        Alert(title: Text("SWITCH SIDES").font(.system(size: 30)), dismissButton: .default(Text("OK")))
                    }
                
                Divider()
                
                //button + away team points
                Button("+", action: incrementTeamB)
                    .frame(width: .infinity, height: 35)
                    .cornerRadius(25)
                    .foregroundColor(.purple)
                    .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
                    .alert(isPresented: $showEndGameAlert) {
                        Alert(title: Text("Final Score:\n\nHome Team: \(pointsA)\nAway Team: \(pointsB)"), primaryButton: .default(Text("Save"),action: {self.showEndGameView = true}), secondaryButton: .destructive(Text("Restart"), action: {
                            pointsA = 0
                            pointsB = 0 }))
                    }
                
                HStack {
                    //label away
                    Text("AWAY:")
                        .font(
                            .system(size: 16).weight(.bold))
                        .foregroundColor(.purple)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0))
                    
                    //away team points
                    Text("\(pointsB)")
                        .font(
                            .system(size: 16).weight(.heavy))
                        .foregroundColor(.purple)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(EdgeInsets(top: 0, leading: -8, bottom: 0, trailing: 0))
                }
                
                //restart button
                Button {
                    sureRestart = true
                } label: {
                    Image(systemName: "gobackward")
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20))
                .buttonStyle(.plain)
                .alert(isPresented: $sureRestart) {
                    Alert(title: Text("Do you want to restart the match?"), primaryButton: .destructive(Text("Restart")) {
                        pointsA = 0
                        pointsB = 0
                    }, secondaryButton: .default(Text("Cancel")))
                }
            }
        }
    }
    struct GameView_Previews: PreviewProvider {
        static var previews: some View {
            GameView()
        }
    }
}
