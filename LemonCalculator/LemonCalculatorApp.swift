//
//  LemonCalculatorApp.swift
//  LemonCalculator
//
//  Created by ailu on 2024/6/1.
//

import SwiftData
import SwiftUI

public struct ModelUtilities {
    public static func getModelContainer(_ types: [any PersistentModel.Type], isStoredInMemoryOnly: Bool = false) -> ModelContainer {
        print(URL.applicationSupportDirectory.path(percentEncoded: false))

        let sharedModelContainer: ModelContainer = {
            let schema = Schema(types)
            let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: isStoredInMemoryOnly)

            do {
                return try ModelContainer(for: schema, configurations: [modelConfiguration])
            } catch {
                fatalError("Could not create ModelContainer: \(error)")
            }
        }()

        return sharedModelContainer
    }
}

@main
struct LemonCalculatorApp: App {
    let container = ModelUtilities.getModelContainer([History.self])
    var vm: ViewModel

    init() {
        vm = ViewModel(modelContext: container.mainContext)
    }

    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .modelContainer(container)
        .environment(vm)
    }
}
