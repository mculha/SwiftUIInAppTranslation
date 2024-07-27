//
//  TranslationModel.swift
//  SwiftUIInAppTranslation
//
//  Created by Melih Çulha on 27.07.2024.
//

import Foundation

struct ReviewModel: Identifiable, Decodable {
    
    let id: UUID
    let title: String
    let review: String
    
    enum CodingKeys: CodingKey {
        case id
        case title
        case review
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = UUID()
        self.title = try container.decode(String.self, forKey: .title)
        self.review = try container.decode(String.self, forKey: .review)
    }
}
