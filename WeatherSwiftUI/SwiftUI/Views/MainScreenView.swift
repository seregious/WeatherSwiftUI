//
//  ContentView.swift
//  WeatherSwiftUI
//
//  Created by Сергей Иванчихин on 25.09.2022.
//

import SwiftUI

struct MainScreenView: View {
    
    @ObservedObject var vm: WeatherViewModel
    
    var body: some View {
        
        
        
        if !vm.dayList.isEmpty {
            
            ScrollView {
                
                HeaderView(vm: vm)
                    .padding()
                    .offset(y: -50)
                
                
                HourWeatherList(vm: vm)
                    .background(.ultraThinMaterial)
                    .cornerRadius(25)
                
                DayWeatherList(vm: vm)
                    .background(.ultraThinMaterial)
                    .cornerRadius(25)
                    .padding(11)
            }
            .background(
                Image(vm.setImage())
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            )
            
        }
        
    }
}
