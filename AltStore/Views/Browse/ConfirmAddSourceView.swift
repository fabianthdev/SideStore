//
//  ConfirmAddSourceView.swift
//  SideStore
//
//  Created by Fabian Thies on 18.11.22.
//  Copyright © 2022 Fabian Thies. All rights reserved.
//

import SwiftUI
import AltStoreCore

struct ConfirmAddSourceView: View {
    
    let fetchedSource: FetchedSource
    var source: Source {
        fetchedSource.source
    }
    
    var confirmationHandler: (_ source: FetchedSource) -> ()
    var cancellationHandler: () -> ()
    
    var body: some View {
        VStack(alignment: .leading) {
            List {
                Section {
                    VStack(alignment: .leading) {
                        Text("\(source.apps.count) Apps")
                        
                        Text(source.apps.map { $0.name }.joined(separator: ", "))
                            .font(.callout)
                            .lineLimit(1)
                            .foregroundColor(.secondary)
                    }
                    
                    VStack() {
                        Text("\(source.newsItems.count) News Items")
                    }
                } header: {
                    Text("Source Contents")
                }
                
                Section {
                    VStack(alignment: .leading) {
                        Text("Source Identifier")
                        Text(source.identifier)
                            .font(.callout)
                            .foregroundColor(.secondary)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Source URL")
                        Text(source.sourceURL.absoluteString)
                            .font(.callout)
                            .foregroundColor(.secondary)
                    }
                } header: {
                    Text("Source Info")
                }
            }
            .listStyle(InsetGroupedListStyle())
            
            Spacer()
            
            SwiftUI.Button {
                confirmationHandler(fetchedSource)
            } label: {
                Label(title: { Text("Add Source") }, icon: { Image(systemName: "plus") })
            }
            .buttonStyle(FilledButtonStyle())
            .padding()
        }
        .background(Color(UIColor.systemGroupedBackground).ignoresSafeArea())
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                SwiftUI.Button {
                    
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.secondary)
                }

            }
            
            ToolbarItemGroup(placement: .navigation) {
                VStack(alignment: .leading) {
                    Text(source.name)
                        .font(.title3)
                        .bold()
                    
                    Text(source.identifier)
                        .font(.callout)
                        .foregroundColor(.secondary)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ConfirmAddSourceView_Previews: PreviewProvider {
    static var previews: some View {
        AddSourceView(continueHandler: { _ in })
    }
}
