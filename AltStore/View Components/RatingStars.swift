//
//  RatingStars.swift
//  SideStore
//
//  Created by Fabian Thies on 18.11.22.
//  Copyright © 2022 Fabian Thies. All rights reserved.
//

import SwiftUI

struct RatingStars: View {
    
    let rating: Int
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<5) { i in
                Image(systemName: i < rating ? "star.fill" : "star")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
    }
}

struct RatingStars_Previews: PreviewProvider {
    static var previews: some View {
        RatingStars(rating: 4)
    }
}
