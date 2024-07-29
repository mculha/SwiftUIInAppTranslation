//
//  TranslationModel.swift
//  SwiftUIInAppTranslation
//
//  Created by Melih Çulha on 27.07.2024.
//

import Foundation

struct ReviewModel: Identifiable, Decodable {
    
    let id: UUID
    let username: String
    let review: String
    var translationText: String?
    
    init(id: UUID = UUID(), username: String, review: String) {
        self.id = id
        self.username = username
        self.review = review
    }
    
    enum CodingKeys: CodingKey {
        case id
        case username
        case review
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = UUID()
        self.username = try container.decode(String.self, forKey: .username)
        self.review = try container.decode(String.self, forKey: .review)
    }
    
    mutating func setTranslation(_ text: String) {
        self.translationText = text
    }
}
