//
//  NewsItemView.swift
//  SideStoreUI
//
//  Created by Fabian Thies on 18.11.22.
//  Copyright © 2022 Fabian Thies. All rights reserved.
//

import SwiftUI
import AltStoreCore

struct NewsItemView: View {
    typealias TapHandler<T> = (T) -> Void
    
    let newsItem: NewsItem
    
    private var newsSelectionHandler: TapHandler<NewsItem>? = nil
    private var appSelectionHandler: TapHandler<StoreApp>? = nil
    
    init(newsItem: NewsItem) {
        self.newsItem = newsItem
    }
    
    var body: some View {
        VStack(spacing: 12) {
            newsContent
                .onTapGesture {
                    newsSelectionHandler?(newsItem)
                }
            
            if let connectedApp = newsItem.storeApp {
                NavigationLink {
                    AppDetailView(storeApp: connectedApp)
                } label: {
                    AppRowView(app: connectedApp)
                }
                .buttonStyle(PlainButtonStyle())

            }
        }
    }
    
    var newsContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            VStack(alignment: .leading, spacing: 12) {
                Text(newsItem.title)
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                
                Text(newsItem.caption)
                    .foregroundColor(.white.opacity(0.7))
            }
            .padding(24)
            
            if let imageUrl = newsItem.imageURL, #available(iOS 15.0, *) {
                AsyncImage(
                    url: imageUrl,
                    content: { image in
                        if let image = image.image {
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                    }
                )
            }
        }
        .frame(
            maxWidth: .infinity,
            alignment: .topLeading
        )
        .background(Color(newsItem.tintColor))
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .circular))
    }
    
    
    func onNewsSelection(_ handler: @escaping TapHandler<NewsItem>) -> Self {
        var newSelf = self
        newSelf.newsSelectionHandler = handler
        return newSelf
    }
    
    func onAppSelection(_ handler: @escaping TapHandler<StoreApp>) -> Self {
        var newSelf = self
        newSelf.appSelectionHandler = handler
        return newSelf
    }
}

extension URL: Identifiable {
    public var id: String {
        return self.absoluteString
    }
}

//struct NewsItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsItemView()
//    }
//}
