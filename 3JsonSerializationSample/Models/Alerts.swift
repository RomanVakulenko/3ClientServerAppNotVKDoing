//
//  Alerts.swift
//  3JsonSerializationSample
//
//  Created by Roman Vakulenko on 25.07.2022.
//

import Foundation

struct Alerts: Decodable {
    let senderName: String
    let event: String
    let start, end: Date
    let description: String
    let tags: [String]
    
    enum CodingKeysAlerts: String, CodingKey {
        case senderName = "sender_name"
        case event
        case start
        case end
        case description
        case tags
    }
}
extension Alerts {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeysAlerts.self)
        senderName = try container.decode(String.self, forKey: .senderName)
        event = try container.decode(String.self, forKey: .event)
        
        let startAlerts = try container.decode(Int.self, forKey: .start)
        start = Date(timeIntervalSince1970: TimeInterval(startAlerts))

        let endAlerts = try container.decode(Int.self, forKey: .end)
        end = Date(timeIntervalSince1970: TimeInterval(endAlerts))
        
        description = try container.decode(String.self, forKey: .description)
        tags = try container.decode([String].self, forKey: .tags)
    }
}
        
/*
 "alerts": [
 {
 "sender_name": "NWS Tulsa",
 "event": "Heat Advisory",
 "start": 1597341600,
 "end": 1597366800,
 "description": "Some info",
 "tags": [
 "Extreme temperature value"
 ]
 }
 ]
 */
