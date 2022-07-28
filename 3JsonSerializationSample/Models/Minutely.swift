//
//  Minutely.swift
//  3JsonSerializationSample
//
//  Created by Roman Vakulenko on 25.07.2022.
//

import Foundation

struct Minutely: Decodable {
    let dt: Date
    let precipitation: Double
    
    enum CodingKeysMinutely: String, CodingKey {
        case dt
        case precipitation
    }
}
extension Minutely {
    init(from decoder: Decoder) throws {//...2. надо создать конструктор (получаем/создаем контейнер)
        let container = try decoder.container(keyedBy: CodingKeysMinutely.self)
        
        //...3. надо распарсить свойства структуры - извлечь значения:
        let dtMinutely = try container.decode(Int.self, forKey: .dt)
        dt = Date(timeIntervalSince1970: TimeInterval(dtMinutely))
        
        precipitation = try container.decode(Double.self, forKey: .precipitation)
    }
}
