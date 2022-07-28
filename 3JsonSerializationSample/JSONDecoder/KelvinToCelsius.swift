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


