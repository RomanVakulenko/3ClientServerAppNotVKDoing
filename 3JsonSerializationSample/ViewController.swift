//
//  ViewController.swift
//  3JsonSerializationSample
//
//  Created by Roman Vakulenko on 18.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
//        private let postDecoder = JsonDecoder () //3.

    override func viewDidLoad() {
        super.viewDidLoad()
        decodeFromText()
    }
}


//        JsonDecodeParsePosts() //3.функция для парсинга данных, полученных с сервера https://jsonplaceholder.typicode.com/posts
      
//3. запросы надо выносить в отдельные сущности:
//    private func JsonDecodeParsePosts() {
//        guard
//            let url = URL(string: "https://jsonplaceholder.typicode.com/posts") //создали url (fake)
//        else { return }
//        
//        URLSession.shared.dataTask(with: url) { data, _, _ in
//            guard let data = data else {
//                return
//            }
//            let posts = try? self.postDecoder.jsonDecoderTest(for: data)
//                .map { $0.title }// посредством этого выведет только title
//            print(posts as Any)
//        }.resume() // и, обязательно(!), запускаем задачу
//    }
//}

