//
//  API.swift
//  SomeWeather
//
//  Created by Jani Niculescu on 31/01/2020.
//  Copyright © 2020 Jani Niculescu. All rights reserved.
//

private let baseUrlForCurrentWeather = URL(string: "https://api.openweathermap.org/data/2.5/weather")!
private let appid = "c8678f8b6fa9c378bbd75e413deeb38c"
private let BaseURLForWeeklyWeather = URL(string: "https://api.openweathermap.org/data/2.5/forecst/daily")

private var decoder: JSONDecoder
{
    let decode = JSONDecoder()
    decode.keyDecodingStrategy = .convertFromSnakeCase
    return decode
}

import SwiftUI

class API
{
    class func fetchCurrentWeather(by city: String, onSuccess: @escaping (Weather) -> Void)
    {
        let query = ["q": "\(city)", "appid": appid, "units": "metric", "lang": "fi"]
        guard let url = baseUrlForCurrentWeather.withQueries(query) else
        {
            fatalError()
        }
        URLSession.shared.dataTask(with: url) {(data, res, err) in
            guard let data = data, err == nil else{
                fatalError(err!.localizedDescription)
            }
            do {
                let weather = try decoder.decode(Weather.self, from: data)
                DispatchQueue.main.async {
                    onSuccess(weather)
                }
            }
            catch{
                fatalError(error.localizedDescription)
            }
        }.resume()
    }

class func weeklyWeather(_ city: String, onSuccess: @escaping (WeeklyWeather) -> Void)
{
    let query = ["q": "\(city)", "appid": appid, "units": "metric","cnt": "5", "lang":"fi"]
    guard BaseURLForWeeklyWeather!.withQueries(query) != nil else
    {
        fatalError("Invalid URL")
    }
    guard let url = BaseURLForWeeklyWeather?.withQueries(query) else
    {
        fatalError()
    }
    
    URLSession.shared.dataTask(with: url) {data, res, err in
        guard let data = data, err == nil else {
            fatalError(err!.localizedDescription)
        }
        do
        {
            let weather = try decoder.decode(WeeklyWeather.self, from:data)
            DispatchQueue.main.async {
                onSuccess(weather)
            }
        }
        catch
        {
            debugPrint(error)
        }
    }.resume()
 }

}
