//
//  SwiftUIView.swift
//  SideStore
//
//  Created by Fabian Thies on 18.11.22.
//  Copyright © 2022 Fabian Thies. All rights reserved.
//

import SwiftUI

struct AppIconView: View {
    let iconUrl: URL?
    var size: CGFloat = 64
    var cornerRadius: CGFloat {
        size * 0.234
    }
    
    var body: some View {
        if let iconUrl, #available(iOS 15.0, *) {
            AsyncImage(url: iconUrl) { image in
                image
                    .resizable()
            } placeholder: {
                Color(UIColor.secondarySystemBackground)
            }
            .frame(width: size, height: size)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
        } else {
            RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                .background(Color.secondary)
                .frame(width: size, height: size)
        }
    }
}

