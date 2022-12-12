//
//  BrowseView.swift
//  SideStoreUI
//
//  Created by Fabian Thies on 18.11.22.
//  Copyright © 2022 Fabian Thies. All rights reserved.
//

import SwiftUI
import AltStoreCore

struct BrowseView: View {
    @SwiftUI.FetchRequest(sortDescriptors: [
        NSSortDescriptor(keyPath: \StoreApp.sourceIdentifier, ascending: true),
        NSSortDescriptor(keyPath: \StoreApp.sortIndex, ascending: true),
        NSSortDescriptor(keyPath: \StoreApp.name, ascending: true),
        NSSortDescriptor(keyPath: \StoreApp.bundleIdentifier, ascending: true)
    ], predicate: NSPredicate(format: "%K != %@", #keyPath(StoreApp.bundleIdentifier), StoreApp.altstoreAppID))
    var apps: FetchedResults<StoreApp>
    
    var filteredApps: [StoreApp] {
        apps.items(matching: self.searchText)
    }
    
    @State
    var selectedStoreApp: StoreApp?
    
    @State var searchText = ""
    
    @State var isShowingSourcesView = false
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 32) {
                ForEach(filteredApps, id: \.bundleIdentifier) { app in
                    NavigationLink {
                        AppDetailView(storeApp: app)
                    } label: {
                        BrowseAppPreviewView(storeApp: app)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding()
            .searchable(text: self.$searchText, placeholder: "Search")
        }
        .background(Color(UIColor.systemGroupedBackground).ignoresSafeArea())
        .navigationTitle("Browse")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                SwiftUI.Button {
                    self.isShowingSourcesView = true
                } label: {
                    Text("Sources")
                }
                .sheet(isPresented: self.$isShowingSourcesView) {
                    NavigationView {
                        SourcesView()
                    }
                }
            }
        }
    }
}

struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseView()
    }
}
