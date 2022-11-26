//
//  AppScreenshotsScrollView.swift
//  SideStore
//
//  Created by Fabian Thies on 27.11.22.
//  Copyright © 2022 SideStore. All rights reserved.
//

import SwiftUI
import AsyncImage


/// Horizontal ScrollView with an asynchronously loaded image for each screenshot URL
///
/// The struct inherits the `Equatable` protocol and implements the respective comparisation function to prevent the view from being constantly re-rendered when a `@State` change in the parent view occurs.
/// This way, the `AppScreenshotsScrollView` will only be reloaded when the parameters change.
struct AppScreenshotsScrollView: View {
    let urls: [URL]
    var aspectRatio: CGFloat = 9/16
    var height: CGFloat = 400
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(urls) { url in
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                    } placeholder: {
                        Rectangle()
                            .foregroundColor(.secondary)
                    }
                    .aspectRatio(aspectRatio, contentMode: .fit)
                    .cornerRadius(8)
                }
            }
            .padding(.horizontal)
        }
        .frame(height: height)
        .shadow(radius: 12)
    }
}

extension AppScreenshotsScrollView: Equatable {
    /// Prevent re-rendering of the view if the parameters didn't change
    static func == (lhs: AppScreenshotsScrollView, rhs: AppScreenshotsScrollView) -> Bool {
        lhs.urls == rhs.urls && lhs.aspectRatio == rhs.aspectRatio && lhs.height == rhs.height
    }
}
