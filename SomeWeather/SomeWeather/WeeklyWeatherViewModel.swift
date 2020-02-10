//
//  WeeklyWeatherViewModel.swift
//  SomeWeather
//
//  Created by Jani Niculescu on 07/02/2020.
//  Copyright © 2020 Jani Niculescu. All rights reserved.
//

import SwiftUI
import Combine

class WeeklyWeatherViewModel: ObservableObject
{
    @Published var weather: WeeklyWeather?
    init()
    {
        self.fetch()
    }
}

extension WeeklyWeatherViewModel
{
    func fetch (by city: String = "Lappeenranta")
    {
        API.weeklyWeather(city)
        {
            self.weather = $0
        }
    }
}
