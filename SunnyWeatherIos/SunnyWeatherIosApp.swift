//
//  SunnyWeatherIosApp.swift
//  SunnyWeatherIos
//
//  Created by wanghaochen04 on 2021/11/7.
//

import SwiftUI

@main
struct SunnyWeatherIosApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
