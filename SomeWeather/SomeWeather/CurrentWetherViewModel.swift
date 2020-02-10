//
//  CurrentWetherViewModel.swift
//  SomeWeather
//
//  Created by Jani Niculescu on 31/01/2020.
//  Copyright © 2020 Jani Niculescu. All rights reserved.
//

import SwiftUI
import Combine

final class CurrentWeatherViewModel: ObservableObject
{
    @Published var current: Weather?
    
    init() {
        self.fetch()
    }
}


extension CurrentWeatherViewModel
{
    func fetch(_ city: String = "lappeenranta")
    {
        API.fetchCurrentWeather(by: city)
        {
            self.current = $0
        }
    }
}


// https://api.darksky.net/forecast/fbad8924e933b91258c3dc7441ed4577/61.05,28.17?lang=fi&units=si
