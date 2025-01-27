//
//  WeatherServices.swift
//  DVTWeatherApp
//
//  Created by Rashida on 26/01/25.
//

import Foundation

class WeatherServices : WeatherServiceProtocol {
    
    func getCurrentLocationWeather(latitude: Double, longitude: Double, completion: @escaping (Result<CurrentWeatherModel, Error>) -> Void) {
        let urlString = "\(Constant.currentWeatherUrl)?lat=\(latitude)&lon=\(longitude)&units=metric&appid=\(Constant.apiKey)"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else { return }
            do {
                let response = try JSONDecoder().decode(CurrentWeatherModel.self, from: data)
                completion(.success(response))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    func getForecastData(latitude: Double, longitude: Double, completion: @escaping (Result<ForecastModel, Error>) -> Void) {
        let urlString = "\(Constant.forecastWeatherUrl)?lat=\(latitude)&lon=\(longitude)&units=metric&appid=\(Constant.apiKey)"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else { return }
            
            do {
                let response = try JSONDecoder().decode(ForecastModel.self, from: data)
                completion(.success(response))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
