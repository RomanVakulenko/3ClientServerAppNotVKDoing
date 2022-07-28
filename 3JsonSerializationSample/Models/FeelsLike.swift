//
//  FeelsLike.swift
//  3JsonSerializationSample
//
//  Created by Roman Vakulenko on 25.07.2022.
//

import Foundation

struct FeelsLike: Decodable {
  let day: Double
  let night: Double
  let eve: Double
  let morn: Double
    
    enum CodingKeysFeelsLike: String, CodingKey {
        case day, night, eve, morn

    }
}
extension FeelsLike: ConvertKelvinToCelsius {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeysFeelsLike.self)
        
        let dayTemp = try container.decode(Double.self, forKey: .day)
        day = FeelsLike.toCelsius(inKelvin: dayTemp)
        
        let nightTemp = try container.decode(Double.self, forKey: .night)
        night = FeelsLike.toCelsius(inKelvin: nightTemp)
        
        let eveTemp = try container.decode(Double.self, forKey: .eve)
        eve = FeelsLike.toCelsius(inKelvin: eveTemp)
        
        let mornTemp = try container.decode(Double.self, forKey: .morn)
        morn = FeelsLike.toCelsius(inKelvin: mornTemp)
    }
}
