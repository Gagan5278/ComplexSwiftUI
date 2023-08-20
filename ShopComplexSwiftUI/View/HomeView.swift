//
//  HomeView.swift
//  ShopComplexSwiftUI
//
//  Created by Gagan Vishal  on 2023/07/30.
//

import SwiftUI

struct HomeView: View {
    private let height: CGFloat = 150.0
    private let paddingConstant: CGFloat = 16.0
    private let curveConstant: CGFloat = 70
    @State var selectedCategory: MainCategory
    
    private let arrayOfCategory: [MainCategory] = [ MainCategory(name: "IT", imageName: "desktopcomputer.and.arrow.down"),
                                                MainCategory(name: "FOOD", imageName: "fork.knife.circle"),
                                                MainCategory(name: "HOME", imageName: "house"),
                                                MainCategory(name: "CAR", imageName: "car"),
                                                MainCategory(name: "SPORT", imageName: "gamecontroller"),
                                                MainCategory(name: "HEALTH", imageName: "thermometer.medium")
    ]
    
    let arrayOfSubCategory: [SubCategory] = [
        SubCategory(imageName: "image1", title: "Indian", count: "24"),
        SubCategory(imageName: "image2", title: "Italian", count: "12"),
        SubCategory(imageName: "image3", title: "Chinese", count: "10"),
        SubCategory(imageName: "image4", title: "Thai", count: "30")
    ]
    var body: some View {
        VStack(alignment: .leading, spacing: 0 ) {
            headerView
                .padding()
                .frame(height: height)
                .background(Color("topColor"))
                .hSpacing(alignment: .top)
                .clipShape(CornerShape(corners: [.bottomRight], size: CGSizeMake(50, 50)))
            HStack {
                textWithImageCurve
                    .padding(.bottom, 70)
                    .frame(width: UIScreen.main.bounds.width - 100)
                    .background(Color("selectColor"))
                    .clipShape((CornerShape(corners: [.bottomRight, .topRight], size: CGSizeMake(curveConstant, curveConstant))))
                    .padding(.top, -50)
            }
            bottomCurve
            Spacer()
            
        }
        .ignoresSafeArea()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(selectedCategory: MainCategory(name: "Car", imageName: "tv.and.mediabox"))
    }
}

// MARK: - Private
extension HomeView {
    
    private var avatarButton: some View {
        Button {
            
        } label: {
            Image("profile")
                .resizable()
                .scaledToFit()
                .frame(width: 44)
                .frame(height: 44)
        }
    }
    
    private var menuButton: some View {
        Button {
            
        } label: {
            Image(systemName: "circle.grid.2x2")
                .font(.title)
                .foregroundColor(.black)
        }
    }
    
    private var headerView: some View {
        HStack {
            menuButton
            Spacer()
            avatarButton
        }
    }
    
    private var bottomCurve: some View {
        ZStack {
            Color("selectColor")
            ScrollView {
                createCategoryHeaderView(with: "Main Categories", imageName: "ellipsis")
                mainCategoryView
                createCategoryHeaderView(with: "Sub Categories", imageName: "ellipsis")

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: paddingConstant) {
                        ForEach(arrayOfSubCategory) { subCategory in
                            SubCategoryView(subCategory: subCategory)
                        }
                    }
                    .padding(.horizontal, paddingConstant)
                }
                .padding(paddingConstant)
                .padding(.bottom, (UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0) + paddingConstant/2)
                Spacer()
            }
            .background(Color.white)
            .clipShape((CornerShape(corners: [.topLeft], size: CGSizeMake(curveConstant, curveConstant))))
        }
    }
    
    private var textWithImageCurve: some View {
        VStack   {
            HStack {
                Image(uiImage: UIImage(named: "circleImage")!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: .infinity, height: 200, alignment: .trailing)
                    .offset(x: 60)
                    .offset(y: -20)
                
            }
            HStack {
                createHeader(with: "Welcome", subTitle: "Find your favourite food")
                    .padding(.leading, 10)
            }
            .hSpacing(alignment: .leading)
        }
    }
    
    func createHeader(with title: String, subTitle: String) -> some View {
        VStack(alignment: .leading) {
            Text("Welcome")
                .font(.body.bold())
            Text("Find your favourite food")
                .font(.title.bold())
        }
    }
    
    private var mainCategoryView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: paddingConstant) {
                ForEach(arrayOfCategory) { cat in
                    MainCategoryCardView(category: cat, selectedCategory: $selectedCategory)
                        .onTapGesture {
                            selectedCategory = cat
                        }
                }
            }
            .padding(.horizontal, paddingConstant)
        }
    }
    
    private func createCategoryHeaderView(with title: String, imageName: String) -> some View {
        HStack {
            Text(title)
            Spacer()
            Image(systemName: imageName)
                .padding(.trailing, paddingConstant)
        }
        .font(.title3.bold())
        .padding(.top, curveConstant/2)
        .padding(.leading, curveConstant/2)
    }
}
