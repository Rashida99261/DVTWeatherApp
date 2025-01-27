//
//  WeatherViewModel.swift
//  DVTWeatherApp
//
//  Created by Rashida on 26/01/25.
//

import Foundation

class WeatherViewModel: NSObject, ObservableObject, LocationServiceDelegate {
    @Published var currentTemperature: String = ""
    @Published var minimumTemperature: String = ""
    @Published var maximumTemperature: String = ""
    @Published var weatherCondition: String = ""
    @Published var forecastList: [ForecastItem] = []
    @Published var backgroundImage: String = "forest_sunny"
    @Published var backgroundColor: String = "Sunny"
    @Published var itemImage: String = "clear"
    @Published var isLoading = true
    
    private let weatherService: WeatherServiceProtocol
    private let locationService: LocationServiceProtocol
    
    
    init(weatherService: WeatherServiceProtocol, locationService: LocationServiceProtocol) {
        if let path = Bundle.main.path(forResource: "Secret", ofType: "plist") {
            if let resource = NSDictionary(contentsOfFile: path) as? [String:String] {
                Constant.apiKey = resource["WEATHER_API_KEY"] ?? ""
            }
        }
        self.weatherService = weatherService
        self.locationService = locationService
        super.init()
        self.locationService.delegate = self
        self.locationService.requestLocation()
    }
    
    
    func didUpdateLocation(latitude: Double, longitude: Double) {
        isLoading = true
        fetchWeather(latitude: latitude, longitude: longitude)
    }
    
    func didFailWithError(_ error: Error) {
        print("Failed to get location: \(error.localizedDescription)")
    }
    
    private func fetchWeather(latitude: Double, longitude: Double) {
        weatherService.getCurrentLocationWeather(latitude: latitude, longitude: longitude) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    self?.handleWeatherResponse(response)
                case .failure(let error):
                    print("Error fetching current weather: \(error)")
                }
            }
        }
        
        weatherService.getForecastData(latitude: latitude, longitude: longitude) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    self?.handleForecastResponse(response.list ?? [])
                case .failure(let error):
                    print("Error fetching forecast: \(error)")
                }
            }
        }
    }
    
    // Parsing of the current weather response
    private func handleWeatherResponse(_ response: CurrentWeatherModel) {
        currentTemperature = "\(Int(response.main?.temp ?? 0.0))°"
        minimumTemperature = "\(Int(response.main?.temp_min ?? 0.0))°"
        maximumTemperature = "\(Int(response.main?.temp_max ?? 0.0))°"
        updateBackgroundImageAndColor(for: response.weather?.first?.main ?? "")
    }
    
    // Parsing of the forecast data
    private func handleForecastResponse(_ response: [ForecastItemList]) {
        var dailyForecastData: [ForecastItem] = []
        let calendar = Calendar.current
        var currentDay = ""
        let daysFound = 0
        
        for forecast in response {
            guard let timestamp = forecast.dt else {
                continue
            }
            let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
            let dayOfWeek = calendar.component(.weekday, from: date)
            let temperature = forecast.main?.temp
            let dayString = dayOfWeekToString(dayOfWeek)
            
            if daysFound < 5 {
                if currentDay == dayString {
                    continue
                } else {
                    dailyForecastData.append(ForecastItem(day: dayString, temperature: Int(temperature ?? 0), icon: ""))
                    currentDay = dayString
                }
            }
        }
        self.forecastList = dailyForecastData
        isLoading = false
    }
    
    
    // update background image and color as per weather condition
    private func updateBackgroundImageAndColor(for condition: String) {
        switch condition.lowercased() {
        case "clear":
            backgroundImage = "forest_sunny"
            backgroundColor = "Sunny"
            itemImage = "clear"
            weatherCondition = "SUNNY"
        case "clouds":
            backgroundImage = "forest_cloudy"
            backgroundColor = "Cloudy"
            itemImage = "partlysunny"
            weatherCondition = "CLOUDY"
        case "rain":
            backgroundImage = "forest_rainy"
            backgroundColor = "Rainy"
            itemImage = "rain"
            weatherCondition = "RAINY"
        default:
            backgroundImage = "forest_sunny"
            backgroundColor = "Sunny"
            itemImage = "clear"
            weatherCondition = "SUNNY"
        }
    }
    
    private func dayOfWeekToString(_ day: Int) -> String {
        ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"][day - 1]
    }
}
