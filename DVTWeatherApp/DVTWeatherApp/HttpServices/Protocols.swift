//
//  protocols.swift
//  DVTWeatherApp
//
//  Created by Rashida on 26/01/25.
//

protocol WeatherServiceProtocol {
    func getCurrentLocationWeather(latitude: Double, longitude: Double, completion: @escaping (Result<CurrentWeatherModel, Error>) -> Void)
    func getForecastData(latitude: Double, longitude: Double, completion: @escaping (Result<ForecastModel, Error>) -> Void)
}

protocol LocationServiceProtocol: AnyObject {
    var delegate: LocationServiceDelegate? { get set }
    func requestLocation()
}

protocol LocationServiceDelegate: AnyObject {
    func didUpdateLocation(latitude: Double, longitude: Double)
    func didFailWithError(_ error: Error)
}
