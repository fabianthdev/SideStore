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
                Text(L10n.AppIDsView.description)
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
        .navigationTitle(L10n.AppIDsView.title)
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                SwiftUI.Button(L10n.Action.done, action: self.dismiss)
            }
        }
    }
}

struct AppIDsView_Previews: PreviewProvider {
    static var previews: some View {
        AppIDsView()
    }
}
