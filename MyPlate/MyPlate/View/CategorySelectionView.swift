//
//  ProductSelectionView.swift
//  MyPlate
//
//  Created by Nitisri on 06/05/23.
//

import SwiftUI

struct CategorySelectionView: View {
    @Binding var categery: Category
    var body: some View {
        HStack(spacing: 0.0, content: {
            ForEach(Category.allCases, id: \.self) { cat in
                    Button {
                        withAnimation {
                            categery = cat
                        }
                    } label: {
                        Text(cat.rawValue)
                            .bold()
                            .font(.caption)
                            .padding(10)
                            .lineLimit(2)
                            .multilineTextAlignment(.center)
                            .foregroundColor((categery == cat) ? .white : .darkText)
                    }
                    .frame(height: 60.0)
                    .background(categery == cat ? Color.darkText : Color.background2)
                    .cornerRadius(25.0)
            }
        })
        .background(Color.background2)
        .frame(height: 60)
        .cornerRadius(25.0)
    }
}

struct ProductSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        CategorySelectionView(categery: .constant(.fruitsAndVegtables))
    }
}
