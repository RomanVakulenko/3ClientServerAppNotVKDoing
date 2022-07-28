//
//  KelvinToCelsius.swift
//  3JsonSerializationSample
//
//  Created by Roman Vakulenko on 27.07.2022.
//

import Foundation

protocol ConvertKelvinToCelsius {
    static func toCelsius (inKelvin: Double) -> Double
}

extension ConvertKelvinToCelsius {
    static func toCelsius (inKelvin: Double) -> Double {
        let convertTemp = Double(inKelvin - 273.15)
        return convertTemp
    }
}

/*Итак:
1. protocol определяет только требования, а реализует детально эти требования extension;
2. static обозначает что, что-либо следующее за static, принадлежит той сущности, где это что-либо объявлено (в нашем случае что-либо - это функция конвертирования температуры, а объявлена фунция в протоколе - значит и принадлежит протоколу); протокол говорит, ЧТО делаем (требования - т.е. функция, принимающая то-то и возвращающая то-то), а экстеншн реализует требования - уточняет КАК именно делаем (т.е. код внутри функции)

далее мы подписываем структуру или ее экстеншн на протокол, где и вызываем через нашу сущность-функцию одну для всех струтур, которая выполняет действие для любой структуры, кот. подписана на протокол
*/
