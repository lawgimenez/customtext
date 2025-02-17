//
//  CustomTextApp.swift
//  CustomText
//
//  Created by Lawrence Gimenez on 6/29/24.
//

import SwiftUI
import SwiftData

@main
struct CustomTextApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            DetailsView()
        }
        .modelContainer(sharedModelContainer)
    }
}
