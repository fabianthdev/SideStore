//
//  RootView.swift
//  SideStoreUI
//
//  Created by Fabian Thies on 18.11.22.
//  Copyright © 2022 Fabian Thies. All rights reserved.
//

import SwiftUI

struct RootView: View {
    
    @State var selectedTab: Tab = .defaultTab
    
    var body: some View {
        TabView(selection: self.$selectedTab) {
            ForEach(Tab.allCases) { tab in
                NavigationView {
                    content(for: tab)
                }
                .tag(tab)
                .tabItem {
                    tab.label
                }
            }
        }
        .overlay(self.notificationsOverlay)
    }
    
    @ViewBuilder
    func content(for tab: Tab) -> some View {
        switch tab {
        case .news:
            NewsView()
        case .browse:
            BrowseView()
        case .myApps:
            MyAppsView()
        case .settings:
            SettingsView()
        }
    }
    
    
    @ObservedObject
    var notificationManager = NotificationManager.shared
    
    var notificationsOverlay: some View {
        VStack {
            Spacer()
            
            ForEach(Array(notificationManager.notifications.values)) { notification in
                VStack(alignment: .leading) {
                    Text(notification.title)
                        .bold()
                    
                    if let message = notification.message {
                        Text(message)
                            .font(.callout)
                    }
                }
                .padding()
                .background(Color(UIColor.altPrimary))
                .clipShape(RoundedRectangle(cornerRadius: 16))
            }
            
            Spacer()
                .frame(height: 50)
        }
        .padding()
        .animation(.easeInOut)
    }
}

extension RootView {
    enum Tab: Int, NavigationTab {
        case news, browse, myApps, settings
        
        static var defaultTab: RootView.Tab  = .news
        
        var displaySymbol: String {
            switch self {
            case .news: return "newspaper"
            case .browse: return "app.dashed"
            case .myApps: return "app.badge"
            case .settings: return "gearshape"
            }
        }

        var displayName: String {
            switch self {
            case .news: return "News"
            case .browse: return "Browse"
            case .myApps: return "My Apps"
            case .settings: return "Settings"
            }
        }
        
        var label: some View {
            Label(self.displayName, systemImage: self.displaySymbol)
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
