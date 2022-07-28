//
//  Temp.swift
//  3JsonSerializationSample
//
//  Created by Roman Vakulenko on 25.07.2022.
//

import Foundation

struct Temp: Decodable {
    let day: Double
    let min: Double
    let max: Double
    let night: Double
    let eve: Double
    let morn: Double
    
    enum CodingKeysTemp: String, CodingKey {
        case day, min, max, night, eve, morn
        
    }
}
extension Temp: ConvertKelvinToCelsius {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeysTemp.self)
        
        let dayTemp = try container.decode(Double.self, forKey: .day)
        day = Temp.toCelsius(inKelvin: dayTemp)
        
        let minTemp = try container.decode(Double.self, forKey: .min)
        min = Temp.toCelsius(inKelvin: minTemp)
        
        let maxTemp = try container.decode(Double.self, forKey: .max)
        max = Temp.toCelsius(inKelvin: maxTemp)
        
        let nightTemp = try container.decode(Double.self, forKey: .night)
        night = Temp.toCelsius(inKelvin: nightTemp)
        
        let eveTemp = try container.decode(Double.self, forKey: .eve)
        eve = Temp.toCelsius(inKelvin: eveTemp)
        
        let mornTemp = try container.decode(Double.self, forKey: .morn)
        morn = Temp.toCelsius(inKelvin: mornTemp)
    }
}
