//
//  AppScreenshotsPreview.swift
//  SideStore
//
//  Created by Fabian Thies on 23.12.22.
//  Copyright © 2022 SideStore. All rights reserved.
//

import SwiftUI
import AsyncImage
import AltStoreCore

struct AppScreenshotsPreview: View {
    
    @Environment(\.dismiss)
    private var dismiss
    
    let urls: [URL]
    let aspectRatio: CGFloat
    @State var index: Int
    
    init(urls: [URL], aspectRatio: CGFloat = 9/16, initialIndex: Int = 0) {
        self.urls = urls
        self.aspectRatio = aspectRatio
        self._index = State(initialValue: initialIndex)
    }
    
    var body: some View {
        TabView(selection: $index) {
            ForEach(Array(urls.enumerated()), id: \.offset) { (i, url) in
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                } placeholder: {
                    Rectangle()
                        .foregroundColor(Color(.secondarySystemBackground))
                        .aspectRatio(aspectRatio, contentMode: .fill)
                }
                .aspectRatio(aspectRatio, contentMode: .fit)
                .cornerRadius(8)
                .padding()
                .tag(i)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                SwiftUI.Button {
                    self.dismiss()
                } label: {
                    Text("Close")
                }
            }
        }
    }
}

extension AppScreenshotsPreview: Equatable {
    /// Prevent re-rendering of the view if the parameters didn't change
    static func == (lhs: AppScreenshotsPreview, rhs: AppScreenshotsPreview) -> Bool {
        lhs.urls == rhs.urls
    }
}

//struct AppScreenshotsPreview_Previews: PreviewProvider {
//    static var previews: some View {
//        AppScreenshotsPreview()
//    }
//}
