//
//  ControleData.swift
//  ftvPoints Watch App
//
//  Created by Eduardo Ferreira on 3/9/23.
//

import Foundation
import CoreData

class ControleData: ObservableObject {
    let container = NSPersistentContainer(name: "JogosModel")
    @Published var listaJogos: [ControleData] = [ControleData]()
    init () {
        container.loadPersistentStores{ desc, error in
            if let error = error {
                print("failed to load data \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("dado salvo!")
        } catch {
            print("we could not save the data")
        }
    }
    func addJogo(name1: String, name2: String, name3: String, name4: String, pointshome: Int, pointsaway: Int, context: NSManagedObjectContext) {
        let jogo = Jogos(context: context)
        jogo.id = UUID()
        jogo.name1 = name1
        jogo.name2 = name2
        jogo.name3 = name3
        jogo.name4 = name4
        jogo.pointshome = Int32(pointshome)
        jogo.pointsaway = Int32(pointsaway)
        jogo.date = Date()
        
        save(context: context)
    }
}

