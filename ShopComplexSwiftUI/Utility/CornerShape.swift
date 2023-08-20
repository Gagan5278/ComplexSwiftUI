//
//  CornerShape.swift
//  ShopComplexSwiftUI
//
//  Created by Gagan Vishal  on 2023/07/30.
//

import SwiftUI

struct CornerShape: Shape {
    var corners: UIRectCorner
    var size: CGSize
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: size
        )
        return Path(path.cgPath)
    }
}
