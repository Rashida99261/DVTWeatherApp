//
//  Constant.swift
//  DVTWeatherApp
//
//  Created by Rashida on 26/01/25.
//

import Foundation
struct Constant {
    static let baseUrl = "https://api.openweathermap.org/data/2.5/"
    static var apiKey = ""
    static let currentWeatherUrl = baseUrl + "weather"
    static let forecastWeatherUrl = baseUrl + "forecast"
}
