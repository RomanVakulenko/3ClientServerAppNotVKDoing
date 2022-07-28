//
//  Daily.swift
//  3JsonSerializationSample
//
//  Created by Roman Vakulenko on 25.07.2022.
//

import Foundation


struct Daily: Decodable {
    let dt, sunrise, sunset: Date
    let moonrise, moonset: Date
    let moonPhase: Double
    let temp: Temp
    let feelsLike: FeelsLike
    let pressure, humidity: Int
    let dewPoint: Double
    let windSpeed, windDeg: Double
    let weather: [Weather]
    let clouds: Int
    let pop, rain, uvi: Double
    
    enum CodingKeysDaily: String, CodingKey {
        case dt, sunrise, sunset
        case moonrise, moonset
        case moonPhase = "moon_phase"
        case temp, pressure, humidity
        case feelsLike = "feels_like"
        case dewPoint = "dew_point"
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case weather, clouds, pop, rain, uvi
    }
}
extension Daily: ConvertKelvinToCelsius {
    init(from decoder: Decoder) throws {//...2. надо создать конструктор (получаем/создаем контейнер)
        let container = try decoder.container(keyedBy: CodingKeysDaily.self)
        
        //...3. надо распарсить свойства структуры - извлечь значения:
        let dtDaily = try container.decode(Int.self, forKey: .dt)
        dt = Date(timeIntervalSince1970: TimeInterval(dtDaily))
        
        let sunriseDaily = try container.decode(Int.self, forKey: .sunrise)
        sunrise = Date(timeIntervalSince1970: TimeInterval(sunriseDaily))
        let sunsetDaily = try container.decode(Int.self, forKey: .sunset)
        sunset = Date(timeIntervalSince1970: TimeInterval(sunsetDaily))
        let moonriseDaily = try container.decode(Int.self, forKey: .moonrise)
        moonrise = Date(timeIntervalSince1970: TimeInterval(moonriseDaily))
        let moonsetDaily = try container.decode(Int.self, forKey: .moonset)
        moonset = Date(timeIntervalSince1970: TimeInterval(moonsetDaily))
        moonPhase = try container.decode(Double.self, forKey: .moonPhase)
        
        temp = try container.decode(Temp.self, forKey: .temp)
        feelsLike = try container.decode(FeelsLike.self, forKey: .feelsLike)
        
        pressure = try container.decode(Int.self, forKey: .pressure)
        humidity = try container.decode(Int.self, forKey: .humidity)
        
        let dewPointDaily = try container.decode(Double.self, forKey: .dewPoint)
        dewPoint = Daily.toCelsius(inKelvin: dewPointDaily)
        
        windSpeed = try container.decode(Double.self, forKey: .windSpeed)
        windDeg = try container.decode(Double.self, forKey: .windDeg)
        weather = try container.decode([Weather].self, forKey: .weather)
        clouds = try container.decode(Int.self, forKey: .clouds)
        pop = try container.decode(Double.self, forKey: .pop)
        rain = try container.decode(Double.self, forKey: .rain)
        uvi = try container.decode(Double.self, forKey: .uvi)
    }
}
