//
//  NewsView.swift
//  SideStoreUI
//
//  Created by Fabian Thies on 18.11.22.
//  Copyright © 2022 Fabian Thies. All rights reserved.
//

import SwiftUI
import AltStoreCore

struct NewsView: View {
    
    @SwiftUI.FetchRequest(sortDescriptors: [
        NSSortDescriptor(keyPath: \NewsItem.date, ascending: false),
        NSSortDescriptor(keyPath: \NewsItem.sortIndex, ascending: true),
        NSSortDescriptor(keyPath: \NewsItem.sourceIdentifier, ascending: true)
    ])
    var news: FetchedResults<NewsItem>
    
    @State
    var activeExternalUrl: URL?
    
    @State
    var selectedStoreApp: StoreApp?
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 24) {
                ForEach(news, id: \.objectID) { newsItem in
                    NewsItemView(newsItem: newsItem)
                        .onNewsSelection { newsItem in
                            self.activeExternalUrl = newsItem.externalURL
                        }
                        .frame(
                            maxWidth: .infinity,
                            alignment: .topLeading
                        )
                }
            }
            .padding()
        }
        .background(Color(UIColor.systemGroupedBackground).ignoresSafeArea())
        .navigationTitle("News")
        .sheet(item: self.$activeExternalUrl) { url in
            SafariView(url: url)
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
