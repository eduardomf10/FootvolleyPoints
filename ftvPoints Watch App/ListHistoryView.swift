//
//  ListHistoryView.swift
//  ftvPoints Watch App
//
//  Created by Eduardo Ferreira on 3/9/23.
//

import SwiftUI

//import coredata
import CoreData

struct ListHistoryView: View {
    
    //coredata
    @Environment(\.managedObjectContext) var managedObjContext
    //coredata date order
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var partida: FetchedResults<Jogos>
    
    var body: some View {
        NavigationView {
            List {
                ForEach (partida) { partida in
                    VStack(alignment: .leading) {
                        //creating custom cell for list
                        HStack{
                            
                            //label home team
                            Text("Home Team:")
                                .padding(EdgeInsets(top: 2, leading: 0, bottom: 2, trailing: 0))
                                .foregroundColor(.orange)
                                .fontWeight(.bold)
                            
                            //label points home team coredata
                            Text("\(partida.pointshome)")
                                .fontWeight(.bold)
                        }
                        
                        //label names home team coredata
                        Text("\(partida.name1!) & \(partida.name2!)")
                            .font(.system(size: 14))
                        HStack{
                            
                            //label away team
                            Text("Away Team:")
                                .padding(EdgeInsets(top: 2, leading: 0, bottom: 2, trailing: 0))
                                .foregroundColor(.purple)
                                .fontWeight(.bold)
                            
                            //label points away team coredata
                            Text("\(partida.pointsaway)").fontWeight(.bold)
                        }
                        
                        //label names away team coredata
                        Text("\(partida.name3!) & \(partida.name4!)")
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 2, trailing: 0))
                            .font(.system(size: 14))
                        
                        //label time/date coredata
                        Text(calcTimeSince(date:partida.date!))
                            .font(.system(size: 10))
                            .foregroundColor(.accentColor)
                            .frame(alignment: .trailing)
                    }
                }
                
                //delete match (reference to function deleteGame) coredata
                .onDelete(perform: deleteGame)
            }
            .listStyle(.plain)
        }
        .navigationTitle("History")
    }
    
    //function delete game coredata
    private func deleteGame(offsets: IndexSet) {
        offsets.map { partida[$0] }.forEach(managedObjContext.delete)
        ControleData().save(context: managedObjContext)
    }
}

struct ListHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        ListHistoryView()
    }
}
