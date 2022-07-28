//
//  JsonSerializationSample.swift
//  3JsonSerializationSample
//
//  Created by Roman Vakulenko on 18.07.2022.
//

import Foundation

//3. 46м у нас 4 поля и далее...
//    struct PostSample2: Codable { //56m сделали структуру Codable, надо чтобы поля ниже совпадали с fake
//        let userId: Int
//        let id: Int
//        let title: String
//        let body: String
//    }
//
//class JsonDecoder {
//
//    private let jsonDecoder = JSONDecoder()//59м вызываем декодер 1 раз, чтобы не расходовать память как если бы он каждый раз создавался бы в функции
//
//    func jsonDecoderTest(for data: Data) throws -> [PostSample2] { //data - абстрактная обертка данныхСети
//        return try jsonDecoder.decode([PostSample2].self, from: data)//[], тк у нас корневой элемет-массив; в однострочных методах return вызывать необязательно - можно без return
//    }
//}

