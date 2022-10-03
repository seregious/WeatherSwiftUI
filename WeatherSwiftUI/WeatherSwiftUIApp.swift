//
//  WeatherSwiftUIApp.swift
//  WeatherSwiftUI
//
//  Created by Сергей Иванчихин on 25.09.2022.
//

import SwiftUI

@main
struct WeatherSwiftUIApp: App {
    
    @StateObject private var vm = WeatherViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                MainScreenView(vm: vm)
            }
            .environmentObject(vm)
        }
    }
}
