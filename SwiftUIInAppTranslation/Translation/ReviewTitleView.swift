//
//  ReviewTitleView.swift
//  SwiftUIInAppTranslation
//
//  Created by Melih Çulha on 29.07.2024.
//
import SwiftUI

struct ReviewTitleView: View {
    
    var translateAction: () -> ()
    
    var body: some View {
        HStack {
            Text("Reviews")
                .font(.system(size: 30, weight: .bold))
            
            Spacer()
            
            Button(action: translateAction) {
                Text("Translate All")
                    .font(.system(size: 14, weight: .semibold))
            }
        }
    }
}

#Preview {
    ReviewTitleView {}
}
