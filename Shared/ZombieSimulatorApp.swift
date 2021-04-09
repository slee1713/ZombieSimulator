//
//  ZombieSimulatorApp.swift
//  Shared
//
//  Created by Spencer Lee on 4/2/21.
//

import SwiftUI

@main
struct ZombieSimulatorApp: App {
    @StateObject var plotDataModel = PlotDataClass(fromLine: true)
    
    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView()
                    .environmentObject(plotDataModel)
                    .tabItem {
                        Text("Plot")
                    }
                TextView()
                    .environmentObject(plotDataModel)
                    .tabItem {
                        Text("Text")
                    }
                            
                            
            }
            
        }
    }

}
