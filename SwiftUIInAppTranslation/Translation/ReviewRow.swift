//
//  ReviewRow.swift
//  SwiftUIInAppTranslation
//
//  Created by Melih Çulha on 27.07.2024.
//
import SwiftUI
import Translation

struct ReviewRow: View {
    let model: ReviewModel
    let action: (TranslationSession, ReviewModel) -> ()
    @State private var translationEnabled: Bool = false
    @State private var configuration: TranslationSession.Configuration?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(model.username)
                    .font(.system(size: 14, weight: .bold))
                
                Spacer()
                
                Image(systemName: "translate")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .onTapGesture {
                        self.triggerTranslation()
                    }
            }
            
            Text(model.translationText ?? model.review)
                .font(.system(size: 12, weight: .regular))
                .lineSpacing(5)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 15)
        .padding(.horizontal, 15)
        .listRowSeparator(.hidden)
        .background(.white)
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(.black.opacity(0.1), lineWidth: 2)
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2)
        .translationPresentation(isPresented: $translationEnabled, text: model.review)
        .onTapGesture {
            self.translationEnabled = true
        }
        .translationTask(configuration) { session in
            self.action(session, model)
        }
    }
    
    private func triggerTranslation() {
        if configuration == nil {
            configuration = TranslationSession.Configuration(target: .init(identifier: "de_DE"))
            return
        }
        configuration?.invalidate()
    }
}
