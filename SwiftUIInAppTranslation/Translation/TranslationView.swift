//
//  TranslationView.swift
//  SwiftUIInAppTranslation
//
//  Created by Melih Çulha on 27.07.2024.
//

import SwiftUI

struct TranslationView: View {
    @State private var viewModel: TranslationViewModel = .init()
    
    var body: some View {
        VStack {
            List {
                ForEach(viewModel.reviews) { model in
                    ReviewRow(model: model)
                }
            }
            .scrollContentBackground(.hidden)
            .listRowInsets(.none)
            .listStyle(.plain)
        }
    }
}

#Preview {
    TranslationView()
}


