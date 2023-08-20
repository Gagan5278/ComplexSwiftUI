//
//  ContentView.swift
//  ShopComplexSwiftUI
//
//  Created by Gagan Vishal  on 2023/07/30.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HomeView(selectedCategory: MainCategory(name: "Car", imageName: "tv.and.mediabox"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
