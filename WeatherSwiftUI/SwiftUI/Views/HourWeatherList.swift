//
//  HourWeatherList.swift
//  WeatherSwiftUI
//
//  Created by Сергей Иванчихин on 28.09.2022.
//

import SwiftUI

struct HourWeatherList: View {
    
    @ObservedObject var vm: WeatherViewModel
    
    var body: some View {
        
        //weather list for the selected day by hours
        HStack {
            ForEach(vm.getWeatherByHour(dayName: vm.selectedDay), id: \.id) {day in
                VStack {
                    AsyncImage(url: vm.getImageUrl(day)){ image in
                        image
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: UIScreen.main.bounds.size.width / 11, height: 40)
                    
                    Text(vm.getHourOfDay(day))
                }
            }
        }
        .padding()
        
    }
}

