//
//  ReviewRow.swift
//  SwiftUIInAppTranslation
//
//  Created by Melih Çulha on 27.07.2024.
//
import SwiftUI

struct ReviewRow: View {
    let model: ReviewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(model.title)
                .font(.system(size: 14, weight: .bold))
            
            Text(model.review)
                .font(.system(size: 12, weight: .regular))
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
        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 0)
    }
}
