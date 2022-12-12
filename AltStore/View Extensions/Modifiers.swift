//
//  Modifiers.swift
//  SideStore
//
//  Created by Fabian Thies on 01.12.22.
//  Copyright © 2022 SideStore. All rights reserved.
//

import SwiftUI

extension View {
    
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
    
    
    @ViewBuilder func searchable(text: Binding<String>, placeholder: String) -> some View {
        if #available(iOS 15.0, *) {
            self.searchable(text: text, prompt: Text(placeholder))
        } else {
            self
        }
    }
}
