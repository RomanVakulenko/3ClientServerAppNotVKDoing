//
//  JsonSerializationSample.swift
//  3JsonSerializationSample
//
//  Created by Roman Vakulenko on 18.07.2022.
//

import Foundation

//class JsonSerialization {
//
//    // 3.3 40m например будем выводить title (цель получить все title)
//    func titles(for data: Data) throws -> [Post] { //throws - значит может выбросить исключение/ошибку
//        let json = try JSONSerialization //тк может выбросить искл. то try as?
//            .jsonObject(with: data, options: .fragmentsAllowed)
//        as? [Dictionary<String, Any>] //.fragmentsAllowed - разрешает парсить вне зависимости что лежит сверху(те 1ый элемет) массив/объект; у нас массив и внутри словарь
//        ?? [] //unwrape by default value-если не получилось вернуть как массив изDictionary - тогдаПустой[]
//
//        // нам нужно пройти по этому массиву из dictionary, 43м - mapping
//        return json.compactMap { item in //принимает в себя замыкание и дает нам объект массива. Идет по итерации и дает нам каждый элемент из массива
//
//// 47m ...и далее посмотрим как это все смапить в структуру, используя только JsonSerialization:
//            guard
//                let userId = item["userId"] as? Int,
//                let id = item["id"] as? Int,
//                let title = item["title"] as? String,
//                let body = item["body"] as? String
//            else {return nil}
//
//            return .init(userId: userId, id: id, title: title, body: body)
////            return item["title"] as? String //45m тк у нас dictionary, от обращаемся к нему так ["title"], если вернется не строка .compactMap позволит нам это опустить (те при возврате nil значение в результирующий массив не добавляется)
//
//        }
//    }
//}
