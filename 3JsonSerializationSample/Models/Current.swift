//
//  Current.swift
//  3JsonSerializationSample
//
//  Created by Roman Vakulenko on 25.07.2022.
//

import Foundation
//3.4 1ч04м чтобы распарсить кастомно(тк у нас дата), то:
struct Current: Decodable {
    let dt: Date
    let sunrise: Date
    let sunset: Date
    let temp: Double
    let feelsLike: Double
    let pressure, humidity: Int
    let dewPoint: Double
    let uvi: Double
    let clouds: Int
    let visibility: Int
    let windSpeed: Int
    let windDeg: Int
    let weather: [Weather]
    let rain: Rain
    
    //...1. надо создать enum CodingKeys
    enum CodingKeysCurrent: String, CodingKey {
        case dt, sunrise, sunset, temp
        case feelsLike = "feels_like"
        case pressure, humidity
        case dewPoint = "dew_point"
        case uvi, clouds, visibility
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case weather, rain
    }
}

extension Current: ConvertKelvinToCelsius {
    init(from decoder: Decoder) throws {//...2. надо создать конструктор (получаем/создаем контейнер)
        let container = try decoder.container(keyedBy: CodingKeysCurrent.self)
        
        //...3. надо распарсить свойства структуры - извлечь значения:
        let dtCurrent = try container.decode(Int.self, forKey: .dt)
        dt = Date(timeIntervalSince1970: TimeInterval(dtCurrent))
        //так меняем Int на Date и в свойстве выше тоже указываем тип Date
        let sunriseCurrent = try container.decode(Int.self, forKey: .sunrise)
        sunrise = Date(timeIntervalSince1970: TimeInterval(sunriseCurrent))

        let sunsetCurrent = try container.decode(Int.self, forKey: .sunset)
        sunset = Date(timeIntervalSince1970: TimeInterval(sunsetCurrent))
        
        let tempCurrent = try container.decode(Double.self, forKey: .temp)
//        temp = tempCurrent - 273.15 //вариант конвертации через формулу, но нарушаем DRY
        temp = Current.toCelsius(inKelvin: tempCurrent) //вариант через протокол+экстеншн
        
        let feelsLikeCurrent = try container.decode(Double.self, forKey: .feelsLike)
        feelsLike = Current.toCelsius(inKelvin: (feelsLikeCurrent)) 
       
        let dewPointCurrent = try container.decode(Double.self, forKey: .dewPoint)
        dewPoint = Current.toCelsius(inKelvin: (dewPointCurrent))
          
        
        pressure = try container.decode(Int.self, forKey: .pressure)
        humidity = try container.decode(Int.self, forKey: .humidity)
        
        uvi = try container.decode(Double.self, forKey: .uvi)
        clouds = try container.decode(Int.self, forKey: .clouds)
        visibility = try container.decode(Int.self, forKey: .visibility)
        windSpeed = try container.decode(Int.self, forKey: .windSpeed)
        windDeg = try container.decode(Int.self, forKey: .windDeg)
        weather = try container.decode([Weather].self, forKey: .weather)
        rain = try container.decode(Rain.self, forKey: .rain)
    }
}


