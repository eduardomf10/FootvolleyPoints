//
//  ftvPointsApp.swift
//  ftvPoints Watch App
//
//  Created by Eduardo Ferreira on 3/9/23.
//

import SwiftUI

@main
struct ftvPoints_Watch_AppApp: App {
    @StateObject private var dataController = ControleData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
