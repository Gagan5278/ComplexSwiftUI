//
//  CardView.swift
//  ShopComplexSwiftUI
//
//  Created by Gagan Vishal  on 2023/08/20.
//

import SwiftUI

struct MainCategoryCardView: View {
    var category: MainCategory
    @Binding var selectedCategory: MainCategory
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: category.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 30)
                .frame(height: 30)
                .padding()
                .background(.white)
                .clipShape(Circle())
            Text(category.name)
                .font(.body.bold())
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .foregroundColor( selectedCategory.id == category.id ?  Color("topColor") : .white)
        }
        .frame(maxWidth: 60)
        .padding(.top, 24)
        .padding(.bottom, 24)
        .padding()
        .background(selectedCategory.id == category.id ? Color("selectColor") :  Color("topColor"))
        .clipShape(Capsule())
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        MainCategoryCardView(category: MainCategory(name: "Car", imageName: "tv.and.mediabox"), selectedCategory: .constant(MainCategory(name: "Car", imageName: "tv.and.mediabox")))
    }
}
