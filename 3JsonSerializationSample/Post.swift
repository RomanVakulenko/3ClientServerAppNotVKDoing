//
//  Post.swift
//  3JsonSerializationSample
//
//  Created by Roman Vakulenko on 18.07.2022.
//

import Foundation
//3. 1h, 4. 35m как делать кастомный конструктор

    struct Post: Decodable {
        init(from decoder: Decoder) throws { //2. создаем конструктор от декодера
            let container = try decoder.container(keyedBy: CodingKeys.self) //3. создаем контейнер
            
            //после этого нам надо инициализировать все наши поля(соблюсти типы и названия кейсов):
            user_id = try container.decode(Int.self, forKey: .user_id)
            id = try container.decode(Int.self, forKey: .id)
            title = try container.decode(String.self, forKey: .title)
            body = try container.decode(String.self, forKey: .body) //...при добавлении нового свойства в структуру ниже нужно будет инициализировать его здесь как и остльные (раньше это было скрыто - синтез)
        }
        
        let user_id: Int
        let id: Int
        let title: String
        let body: String
        
        enum CodingKeys: String, CodingKey {
            case user_id = "userId"
            case id
            case title
            case body
        }
    }
