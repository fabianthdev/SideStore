//
//  AppDetailView.swift
//  SideStore
//
//  Created by Fabian Thies on 18.11.22.
//  Copyright © 2022 Fabian Thies. All rights reserved.
//

import SwiftUI
import AsyncImage
import ExpandableText
import SFSafeSymbols
import AltStoreCore

struct AppDetailView: View {
    
    let storeApp: StoreApp

    var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        return dateFormatter
    }()

    var byteCountFormatter: ByteCountFormatter = {
        let formatter = ByteCountFormatter()
        return formatter
    }()
    
    @State var scrollOffset: CGFloat = .zero
    let maxContentCornerRadius: CGFloat = 24
    let headerViewHeight: CGFloat = 140
    let permissionColumns = 4
    
    var headerBlurRadius: CGFloat {
        min(20, max(0, 20 - (scrollOffset / -150) * 20))
    }
    var isHeaderViewVisible: Bool {
        scrollOffset < headerViewHeight + 12
    }
    var contentCornerRadius: CGFloat {
        max(CGFloat.zero, min(maxContentCornerRadius, maxContentCornerRadius * (1 - self.scrollOffset / self.headerViewHeight)))
    }
    
    var body: some View {
        ObservableScrollView(scrollOffset: $scrollOffset) { proxy in
            LazyVStack {
                headerView
                    .frame(height: headerViewHeight)
                
                contentView
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                AppPillButton(app: storeApp)
                    .disabled(isHeaderViewVisible)
                    .offset(y: isHeaderViewVisible ? 12 : 0)
                    .opacity(isHeaderViewVisible ? 0 : 1)
                    .animation(.easeInOut(duration: 0.2), value: isHeaderViewVisible)
            }
            
            ToolbarItemGroup(placement: .principal) {
                HStack {
                    Spacer()
                    AppIconView(iconUrl: storeApp.iconURL, size: 24)
                    Text(storeApp.name)
                        .bold()
                    Spacer()
                }
                .offset(y: isHeaderViewVisible ? 12 : 0)
                .opacity(isHeaderViewVisible ? 0 : 1)
                .animation(.easeInOut(duration: 0.2), value: isHeaderViewVisible)
            }
        }
    }
    
    
    var headerView: some View {
        ZStack(alignment: .center) {
            GeometryReader { proxy in
                AppIconView(iconUrl: storeApp.iconURL, size: proxy.frame(in: .global).width)
                    .blur(radius: headerBlurRadius)
                    .offset(y: min(0, scrollOffset))
            }
            .padding()
            
            AppRowView(app: storeApp)
                .padding(.horizontal)
        }
    }
    
    var contentView: some View {
        VStack(alignment: .leading, spacing: 32) {
            if storeApp.sourceIdentifier == Source.altStoreIdentifier {
                officialAppBadge
            }
            
            if let subtitle = storeApp.subtitle {
                Text(subtitle)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal)
            }
            
            if !storeApp.screenshotURLs.isEmpty {
                // Equatable: Only reload the view if the screenshots change.
                // This prevents unnecessary redraws on scroll.
                AppScreenshotsScrollView(urls: storeApp.screenshotURLs)
                    .equatable()
            }
            
            ExpandableText(text: storeApp.localizedDescription)
                .lineLimit(6)
                .expandButton(TextSet(text: "More...", font: .callout, color: .accentColor))
                .padding(.horizontal)
            
            currentVersionView
                .padding(.horizontal)
            
            permissionsView
                .padding(.horizontal)
            
            // TODO: Add review view
            // Only let users rate the app if it is currently installed!
        }
        .padding(.vertical)
        .background(
            RoundedRectangle(cornerRadius: contentCornerRadius)
                .foregroundColor(Color(UIColor.systemBackground))
                .shadow(radius: isHeaderViewVisible ? 12 : 0)
        )
    }
    
    var officialAppBadge: some View {
        HStack {
            Spacer()
            Image(systemSymbol: .checkmarkSealFill)
            Text("Official App")
            Spacer()
        }
        .foregroundColor(.accentColor)
    }
    
    var trustedAppBadge: some View {
        HStack {
            Spacer()
            Image(systemSymbol: .shieldLefthalfFill)
            Text("From Trusted Source")
            Spacer()
        }
        .foregroundColor(.accentColor)
    }
    
    var currentVersionView: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .bottom) {
                VStack(alignment: .leading) {
                    Text("What's New")
                        .bold()
                        .font(.title3)
                    
                    Text("Version \(storeApp.version)")
                        .font(.callout)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text(dateFormatter.string(from: storeApp.versionDate))
                    Text(byteCountFormatter.string(fromByteCount: Int64(storeApp.size)))
                }
                .font(.callout)
                .foregroundColor(.secondary)
            }
            
            if let versionDescription = storeApp.versionDescription {
                ExpandableText(text: versionDescription)
                    .lineLimit(5)
                    .expandButton(TextSet(text: "More...", font: .callout, color: .accentColor))
            } else {
                Text("No version information")
                    .foregroundColor(.secondary)
            }
        }
    }
    
    var permissionsView: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Permissions")
                .bold()
                .font(.title3)
            
            if storeApp.permissions.isEmpty {
                Text("The app requires no permissions.")
                    .font(.callout)
                    .foregroundColor(.secondary)
            } else {
                AppPermissionsGrid(permissions: storeApp.permissions)
            }
            
            Spacer()
        }
    }
}
