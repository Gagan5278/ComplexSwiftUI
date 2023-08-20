//
//  SubCategoryView.swift
//  ShopComplexSwiftUI
//
//  Created by Gagan Vishal  on 2023/08/20.
//

import SwiftUI

struct SubCategoryView: View {
    var subCategory: SubCategory

    var body: some View {
        ZStack {
            Image(subCategory.imageName)
                .resizable()
                .scaledToFill()
            VStack {
                Text(subCategory.title)
                    .font(.title.bold())
                Text("Total reciepies: \(subCategory.count)")
                    .font(.body.bold())
            }
            .shadow(color: .black, radius: 5)
            .foregroundColor(.white)
        }
        .frame(width: 300)
        .frame(height: 200)
        .cornerRadius(16)
    }
}

struct SubCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        SubCategoryView(subCategory: SubCategory(imageName: "image1", title: "Test", count: "13"))
    }
}
