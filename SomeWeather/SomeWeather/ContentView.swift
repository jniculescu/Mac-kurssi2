//
//  ContentView.swift
//  SomeWeather
//
//  Created by Jani Niculescu on 31/01/2020.
//  Copyright © 2020 Jani Niculescu. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selected = 0
    @ObservedObject var weather = CurrentWeatherViewModel()
    
    @ObservedObject var weeklyWeather = WeeklyWeatherViewModel()
    private var height = UIScreen.main.bounds.height
    
    var body: some View {
        VStack(alignment: .center, spacing: 20)
            {
                GeometryReader{ gr in
                        CurrentWeather(weather: self.weather.current, height: self.selected == 0 ? gr.size.height: gr.size.height * 0.50).animation(.easeInOut(duration: 0.50))
        }
                
                WeeklyWeatherView(listData: weeklyWeather.weather?.list ?? [], value: selected, height: height * 0.5)
        VStack
            {
                Picker("", selection: $selected)
                {
                    Text("Today")
                    .tag(0)
                    Text("Week")
                    .tag(1)
                }.pickerStyle(SegmentedPickerStyle()).padding(.horizontal)
        }
    }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
  }
}


//maketh double into whole w/o decimal
