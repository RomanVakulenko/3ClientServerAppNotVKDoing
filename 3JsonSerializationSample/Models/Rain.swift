//
//  Rain.swift
//  3JsonSerializationSample
//
//  Created by Roman Vakulenko on 25.07.2022.
//

import Foundation

struct Rain: Decodable {
    let oneHour: Double
    //если называешь enum отлично от CodingKeys - то и парсить надо руками (xcode видит, что есть кастомное перечисление, значит и должен быть и кастомный конструктор и сам его(конструктор) не создает, поэтому без extension, где мы создаем контейнер и извлекаем данные, будет выдавать ошибку:
//    "No value associated with key CodingKeys(stringValue: \"oneHour\", intValue: nil) (\"oneHour\").", underlyingError: nil))
    enum CodingKeysRain: String, CodingKey {
        case oneHour = "1h"
    }
}

extension Rain {
    init(from decoder: Decoder) throws {//...2. надо создать конструктор (получаем/создаем контейнер)
        let container = try decoder.container(keyedBy: CodingKeysRain.self)

        //...3. надо распарсить свойства структуры - извлечь значения:
        oneHour = try container.decode(Double.self, forKey: .oneHour)
    }
}
