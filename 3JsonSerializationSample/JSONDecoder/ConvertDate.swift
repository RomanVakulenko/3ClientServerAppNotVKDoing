//
//  ConvertDate.swift
//  3JsonSerializationSample
//
//  Created by Roman Vakulenko on 28.07.2022.
//

import Foundation

protocol ConvertDate {
    static func convertDateFromJson (jsonDate: Int) -> Date
}

extension ConvertDate {
    static func convertDateFromJson (jsonDate: Int) -> Date {
        let converting = Date(timeIntervalSince1970: TimeInterval(jsonDate))
        return converting
    }
}
