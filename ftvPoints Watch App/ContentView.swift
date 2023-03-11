//
//  ContentView.swift
//  ftvPoints Watch App
//
//  Created by Eduardo Ferreira on 3/9/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                //title
                Text("FOOTVOLLEY")
                    .font(.system(size: 19))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.indigo)
                    .fontWeight(.heavy)
                    .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                Text("POINTS")
                    .font(.system(size: 19))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.indigo)
                    .fontWeight(.heavy)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                
                //buttons
                
                //button start
                NavigationLink("START", destination: GameView())
                    .font(.system(size: 15))
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                
                //button list of games
                NavigationLink("MATCHES  \(Image(systemName: "list.clipboard"))", destination: ListHistoryView())
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                    .font(.system(size: 15))
                    .opacity(0.9)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
