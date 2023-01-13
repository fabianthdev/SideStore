//
//  AppIDsView.swift
//  SideStore
//
//  Created by Fabian Thies on 23.12.22.
//  Copyright © 2022 SideStore. All rights reserved.
//

import SwiftUI
import AltStoreCore

struct AppIDsView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @SwiftUI.FetchRequest(sortDescriptors: [
        NSSortDescriptor(keyPath: \AppID.name, ascending: true),
        NSSortDescriptor(keyPath: \AppID.bundleIdentifier, ascending: true),
        NSSortDescriptor(keyPath: \AppID.expirationDate, ascending: true)
    ], predicate: NSPredicate(format: "%K == %@", #keyPath(AppID.team), DatabaseManager.shared.activeTeam() ?? Team()))
    var appIDs: FetchedResults<AppID>
    
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                Text("Each app and app extension installed with SideStore must register an App ID with Apple.\n\nApp IDs for paid developer accounts never expire, and there is no limit to how many you can create.")
                    .foregroundColor(.secondary)
                
                ForEach(appIDs, id: \.identifier) { appId in
                    VStack {
                        Text(appId.name)
                        
                        Text(appId.identifier)
                            .font(.callout)
                            .foregroundColor(.secondary)
                    }
                    .padding()
                    .tintedBackground(.accentColor)
                    .clipShape(RoundedRectangle(cornerRadius: 30, style: .circular))
                }
            }
            .padding()
        }
        .navigationTitle("App IDs")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                SwiftUI.Button("Done", action: self.dismiss)
            }
        }
    }
}

struct AppIDsView_Previews: PreviewProvider {
    static var previews: some View {
        AppIDsView()
    }
}
