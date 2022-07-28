//
//  Weather.swift
//  3JsonSerializationSample
//
//  Created by Roman Vakulenko on 25.07.2022.
//

import Foundation

struct Weather: Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String?
    
    enum CodingKeysWeather: String, CodingKey { // 1 - создали enum CodingKeysWeather
        case id, main, description, icon
    }
}
    
    extension Weather {
        init(from decoder: Decoder) throws { // 2 - создали конструктор
            let container = try decoder.container(keyedBy: CodingKeysWeather.self) // 3 - создали контейнер - возвращает данные, хранящиеся в этом декодере, представленные в контейнере, ключ которого задан значениями в CodingKeysWeather
            
            // 4 - инициализируем и извлекаем значения с
            id = try container.decode(Int.self, forKey: .id) //декодирует значение заданного типа для заданного ключа
            main = try container.decode(String.self, forKey: .main)
            description = try container.decode(String.self, forKey: .description)
            icon = try container.decodeIfPresent(String.self, forKey: .icon) //3.4 1ч.10м - если свойство является опционалом, тогда используем decodeIfPresent
            //1h13m 2ой вариант как распарсить опционал - try?, так ошибка превратится в nil, а icon: Optional("значение icon'a")
            //        icon = try? container.decode(String.self, forKey: .icon)
            
        }
    }
