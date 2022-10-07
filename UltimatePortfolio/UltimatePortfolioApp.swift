//
//  UltimatePortfolioApp.swift
//  UltimatePortfolio
//
//  Created by Malcolm Goldiner on 10/5/22.
//

import SwiftUI

@main
struct UltimatePortfolioApp: App {
    // This is a stateobject struct with a data controller inside of it
    @StateObject var dataController: DataController
    
    init() {
        let dataController = DataController()
        // _dataController is the state object itself not the DataController()
        _dataController = StateObject(wrappedValue: dataController)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
                .environmentObject(dataController)
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification), perform: save)
        }
    }
    
    func save(_note: Notification) {
        dataController.save()
    }
}
