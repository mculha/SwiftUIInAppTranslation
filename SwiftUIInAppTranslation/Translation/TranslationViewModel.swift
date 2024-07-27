//
//  TranslationViewModel.swift
//  SwiftUIInAppTranslation
//
//  Created by Melih Çulha on 27.07.2024.
//

import SwiftUI

@Observable final class TranslationViewModel {
    
    var reviews: [ReviewModel] = []
    
    init() {
        self.decodeReviews()
    }
}

extension TranslationViewModel {
    
    private func decodeReviews() {
        let url = Bundle.main.url(forResource: "reviews", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let decoder: JSONDecoder = .init()
        let jsonData = try! decoder.decode([ReviewModel].self, from: data)
        self.reviews = jsonData
    }
}
