//
//  SubCategory.swift
//  ShopComplexSwiftUI
//
//  Created by Gagan Vishal  on 2023/08/20.
//

import Foundation

struct SubCategory: Identifiable {
    var id = UUID().uuidString
    let imageName: String
    let title: String
    let count: String
}
