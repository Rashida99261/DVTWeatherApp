//
//  ForecastModel.swift
//  DVTWeatherApp
//
//  Created by Rashida on 26/01/25.
//

import Foundation
// Model file generated using https://www.json4swift.com
struct ForecastModel : Codable {
    let cod : String?
    let message : Int?
    let cnt : Int?
    let list : [ForecastItemList]?

    enum CodingKeys: String, CodingKey {
        case cod = "cod"
        case message = "message"
        case cnt = "cnt"
        case list = "list"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        cod = try values.decodeIfPresent(String.self, forKey: .cod)
        message = try values.decodeIfPresent(Int.self, forKey: .message)
        cnt = try values.decodeIfPresent(Int.self, forKey: .cnt)
        list = try values.decodeIfPresent([ForecastItemList].self, forKey: .list)
    }

}


struct ForecastItemList : Codable {
    let dt : Int?
    let main : WMain?
    let weather : [Weather]?
    let clouds : Clouds?
    let wind : Wind?
    let rain : Rain?
    let dt_txt : String?

    enum CodingKeys: String, CodingKey {

        case dt = "dt"
        case main = "main"
        case weather = "weather"
        case clouds = "clouds"
        case wind = "wind"
        case rain = "rain"
        case dt_txt = "dt_txt"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        dt = try values.decodeIfPresent(Int.self, forKey: .dt)
        main = try values.decodeIfPresent(WMain.self, forKey: .main)
        weather = try values.decodeIfPresent([Weather].self, forKey: .weather)
        clouds = try values.decodeIfPresent(Clouds.self, forKey: .clouds)
        wind = try values.decodeIfPresent(Wind.self, forKey: .wind)
        rain = try values.decodeIfPresent(Rain.self, forKey: .rain)
        dt_txt = try values.decodeIfPresent(String.self, forKey: .dt_txt)
    }

}

struct ForecastItem {
    var day: String
    var temperature: Int
    var icon: String
}

