//
//  View+Extension.swift
//  ShopComplexSwiftUI
//
//  Created by Gagan Vishal  on 2023/07/30.
//

import SwiftUI

extension View {
    func hSpacing(alignment: Alignment) -> some View {
        self
            .frame(maxWidth: .infinity, alignment: alignment)
    }
    
    func vSpacing(alignment: Alignment) -> some View {
        self
            .frame(maxHeight: .infinity, alignment: alignment)
    }
}
