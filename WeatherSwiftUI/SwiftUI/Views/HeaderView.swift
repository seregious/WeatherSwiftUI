//
//  Header.swift
//  WeatherSwiftUI
//
//  Created by Сергей Иванчихин on 26.09.2022.
//

import SwiftUI

struct HeaderView: View {
    
    @ObservedObject var vm: WeatherViewModel
    
    var body: some View {
        
        
        VStack {
                      
            //city name
            Text(vm.city)
            
            //current temperature from the first element in the list
            Text(String(Int(vm.dayList.first?.main.temp ?? 0.0))+"°")
                .font(.largeTitle)
            
            //description of the current weather
            Text(vm.dayList.first?.weather.first?.weatherDescription ?? "")
            
            HStack {
                
                //sunrise image and time
                HStack {
                    Image(systemName: "sunrise")
                    Text(vm.sunrise)
                }
                
                Spacer()
                
                //sunset image and time
                HStack {
                    Image(systemName: "sunset")
                    Text(vm.sunset)
                }
            }
        }
    }
}
