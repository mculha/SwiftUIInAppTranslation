//
//  TranslationView.swift
//  SwiftUIInAppTranslation
//
//  Created by Melih Çulha on 27.07.2024.
//

import SwiftUI
import Translation

struct TranslationView: View {
    @State private var viewModel: TranslationViewModel = .init()
    @State private var configuration: TranslationSession.Configuration?

    var body: some View {
        VStack {
            List {
                ReviewTitleView(translateAction: translateAllPressed)
                
                ForEach(viewModel.reviews) { model in
                    ReviewRow(model: model, action: viewModel.translateReview)
                }
            }
            .scrollContentBackground(.hidden)
            .listRowInsets(.none)
            .listStyle(.plain)
            .translationTask(configuration) { session in
                self.viewModel.translateAll(session: session)
            }
        }
    }
    
    private func translateAllPressed() {
        if configuration == nil {
            configuration = TranslationSession.Configuration(target: .init(identifier: "de_DE"))
            return
        }
        configuration?.invalidate()
    }
}

#Preview {
    TranslationView()
}


