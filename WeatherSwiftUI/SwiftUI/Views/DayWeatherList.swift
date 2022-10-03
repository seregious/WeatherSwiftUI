//
//  DayWeatherList.swift
//  WeatherSwiftUI
//
//  Created by Сергей Иванчихин on 26.09.2022.
//

import SwiftUI

struct DayWeatherList: View {
    
    @ObservedObject var vm: WeatherViewModel
    
    var body: some View {
        
        VStack {
            ForEach(vm.getWeatherByDay(), id: \.id) {day in
                
                VStack {
                    HStack {
                        
                        //triangle for the selected day of the week
                        Rectangle()
                            .trim(from: 0, to: 0.5)
                            .fill(.blue)
                            .frame(width: 10, height: 10)
                            .rotationEffect(.degrees(45))
                            .padding(.trailing, 10)
                            .opacity(vm.checkDayFor(day) ? 1 : 0)
                        
                        //the day of the week and date
                        VStack(alignment: .leading) {
                            Text(vm.getDayOfWeek(day))
                                .padding(.bottom, 5)
                            Text(vm.getDateOfDay(day))
                        }
                        
                        Spacer()
                        
                        //the temperature of the day and the weather image
                        HStack {
                            Text(String(Int(day.main.temp))+"°")
                            AsyncImage(url: vm.getImageUrl(day)){ image in
                                image
                            } placeholder: {
                                ProgressView()
                            }
                        }
                    }
                    if day.id != vm.getWeatherByDay().last?.id {
                        Divider ()
                    }
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    vm.changeCurrentDay(day)
                }
            }
        }
        .padding()
    }
}
