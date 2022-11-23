//
//  BrowseAppPreviewView.swift
//  SideStore
//
//  Created by Fabian Thies on 20.11.22.
//  Copyright © 2022 Fabian Thies. All rights reserved.
//

import SwiftUI
import AltStoreCore

struct BrowseAppPreviewView: View {
    let storeApp: StoreApp
    
    var body: some View {
        VStack {
            AppRowView(app: storeApp)
            
            if let subtitle = storeApp.subtitle {
                Text(subtitle)
            }
            
            if !storeApp.screenshotURLs.isEmpty {
                HStack {
                    ForEach(storeApp.screenshotURLs.prefix(2)) { url in
                        if #available(iOS 15.0, *) {
                            AsyncImage(url: url) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            } placeholder: {
                                Color(UIColor.secondarySystemBackground)
                            }
                            .cornerRadius(8)
                        }
                    }
                }
                .frame(height: 300)
            }
        }
    }
}

//struct BrowseAppPreviewView_Previews: PreviewProvider {
//    static var previews: some View {
//        BrowseAppPreviewView()
//    }
//}
