//
//  TranslationViewModel.swift
//  SwiftUIInAppTranslation
//
//  Created by Melih Çulha on 27.07.2024.
//

import SwiftUI
import Translation

@Observable final class TranslationViewModel {
    
    var reviews: [ReviewModel] = []
    
    init() {
        self.decodeReviews()
    }
}

extension TranslationViewModel {
    
    func translateReview(_ session: TranslationSession, _ model: ReviewModel) {
        Task { @MainActor in
            let response = try await session.translate(model.review)
            self.changeTranslationText(review: response.sourceText, translation: response.targetText)
        }
    }
    
    private func changeTranslationText(review: String, translation: String) {
        guard let index = reviews.firstIndex (where: { $0.review == review }) else { return }
        reviews[index].setTranslation(translation)
    }
}

extension TranslationViewModel {
    
    func translateAll(session: TranslationSession) {
        Task { @MainActor in
            let request: [TranslationSession.Request] = reviews.map { .init(sourceText: $0.review) }
            
            let responses = try await session.translations(from: request)
            for response in responses {
                self.changeTranslationText(review: response.sourceText, translation: response.targetText)
            }
        }
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
