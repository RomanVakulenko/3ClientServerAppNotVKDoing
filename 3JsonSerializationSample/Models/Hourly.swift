//
//  Hourly.swift
//  3JsonSerializationSample
//
//  Created by Roman Vakulenko on 25.07.2022.
//

import Foundation

struct Hourly: Decodable {
    let dt: Date
    let temp: Double
    let feelsLike: Double
    let pressure: Int
    let humidity: Int
    let dewPoint: Double
    let uvi: Double
    let clouds: Int
    let visibility: Int
    let windSpeed: Double
    let windDeg: Int
    let windGust: Double
    let weather: [Weather]
    let pop: Double
    
    enum CodingKeysHourly: String, CodingKey {
        case dt
        case temp
        case feelsLike = "feels_like"
        case pressure, humidity
        case dewPoint = "dew_point"
        case uvi, clouds, visibility
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case windGust = "wind_gust"
        case weather, pop
    }
}
extension Hourly: ConvertKelvinToCelsius {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeysHourly.self)
        
        let dtHourly = try container.decode(Int.self, forKey: .dt)
        dt = Date(timeIntervalSince1970: TimeInterval(dtHourly))

        
        let tempHourly = try container.decode(Double.self, forKey: .temp)
//        temp = tempCurrent - 273.15 //вариант конвертации через формулу, но нарушаем DRY
        temp = Hourly.toCelsius(inKelvin: tempHourly) //вариант через протокол+экстеншн
        
        let feelsLikeHourly = try container.decode(Double.self, forKey: .feelsLike)
        feelsLike = Hourly.toCelsius(inKelvin: (feelsLikeHourly))
       
        let dewPointHourly = try container.decode(Double.self, forKey: .dewPoint)
        dewPoint = Hourly.toCelsius(inKelvin: (dewPointHourly))
        
        
        pressure = try container.decode(Int.self, forKey: .pressure)
        humidity = try container.decode(Int.self, forKey: .humidity)
        
        uvi = try container.decode(Double.self, forKey: .uvi)
        clouds = try container.decode(Int.self, forKey: .clouds)
        visibility = try container.decode(Int.self, forKey: .visibility)
        windSpeed = try container.decode(Double.self, forKey: .windSpeed)
        windDeg = try container.decode(Int.self, forKey: .windDeg)
        windGust = try container.decode(Double
            .self, forKey: .windGust)
        weather = try container.decode([Weather].self, forKey: .weather)
        pop = try container.decode(Double.self, forKey: .pop)
    }
}
