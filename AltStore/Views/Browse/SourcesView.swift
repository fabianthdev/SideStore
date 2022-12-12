//
//  SourcesView.swift
//  SideStore
//
//  Created by Fabian Thies on 20.11.22.
//  Copyright © 2022 Fabian Thies. All rights reserved.
//

import SwiftUI
import AltStoreCore
import CoreData

struct SourcesView: View {
    
    @Environment(\.dismiss)
    private var dismiss
    
    @Environment(\.managedObjectContext)
    var managedObjectContext
    
    @SwiftUI.FetchRequest(sortDescriptors: [
        NSSortDescriptor(keyPath: \Source.name, ascending: true),
        NSSortDescriptor(keyPath: \Source.sourceURL, ascending: true),
        NSSortDescriptor(keyPath: \Source.identifier, ascending: true)
    ])
    var installedSources: FetchedResults<Source>
    
    
    @State var isShowingAddSourceAlert = false
    @State var sourceToConfirm: FetchedSource?
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 24) {
                // Installed Sources
                LazyVStack(alignment: .leading, spacing: 12) {
                    Text("Sources control what apps are available to download through SideStore.")
                        .font(.callout)
                        .foregroundColor(.secondary)
                    
                    ForEach(installedSources, id: \.identifier) { source in
                        
                        VStack(alignment: .leading) {
                            Text(source.name)
                                .bold()
                            
                            Text(source.sourceURL.absoluteString)
                                .font(.callout)
                                .foregroundColor(.secondary)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(Color.accentColor.opacity(0.5))
                        .clipShape(RoundedRectangle(cornerRadius: 30, style: .circular))
                        .if(source.identifier != Source.altStoreIdentifier) { view in
                            view.contextMenu(ContextMenu(menuItems: {
                                SwiftUI.Button {
                                    self.removeSource(source)
                                } label: {
                                    Label("Remove", systemImage: "trash")
                                }
                            }))
                        }
                    }
                }
                
                // Trusted Sources
                LazyVStack(alignment: .leading) {
                    Text("Trusted Sources")
                        .font(.title3)
                        .bold()
                    
                    Text("SideStore has reviewed these sources to make sure they meet our safety standards.")
                        .font(.callout)
                        .foregroundColor(.secondary)
                    
                    
                }
            }
            .padding()
        }
        .navigationTitle("Sources")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                SwiftUI.Button {
                    self.isShowingAddSourceAlert = true
                } label: {
                    Image(systemName: "plus")
                }
                .sheet(isPresented: self.$isShowingAddSourceAlert) {
                    NavigationView {
                        AddSourceView(continueHandler: fetchSource(with:))
                    }
                }
                .sheet(item: self.$sourceToConfirm) { source in
                    if #available(iOS 16.0, *) {
                        NavigationView {
                            ConfirmAddSourceView(fetchedSource: source, confirmationHandler: addSource(_:)) {
                                self.sourceToConfirm = nil
                            }
                        }
                        .presentationDetents([.medium])
                    }
                }
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                SwiftUI.Button(action: self.dismiss) {
                    Text("Done").bold()
                }
            }
        }
    }
    
    
    func fetchSource(with urlText: String) {
        self.isShowingAddSourceAlert = false
        
        guard let url = URL(string: urlText) else {
            return
        }
        
        AppManager.shared.fetchSource(sourceURL: url) { result in
            
            switch result {
            case let .success(source):
                self.sourceToConfirm = FetchedSource(source: source)
            case let .failure(error):
                print(error)
            }
        }
    }
    
    func addSource(_ source: FetchedSource) {
        source.context?.perform {
            do {
                try source.context?.save()
            } catch {
                print(error)
            }
        }
        
        self.sourceToConfirm = nil
    }
    
    func removeSource(_ source: Source) {
        DatabaseManager.shared.persistentContainer.performBackgroundTask { (context) in
            let source = context.object(with: source.objectID) as! Source
            context.delete(source)
            
            do {
                try context.save()
            } catch {
                print(error)
            }
        }
    }
}

struct SourcesListView_Previews: PreviewProvider {
    static var previews: some View {
        SourcesView()
    }
}


extension Source: Identifiable {
    public var id: String {
        self.identifier
    }
}


struct FetchedSource: Identifiable {
    let source: Source
    let context: NSManagedObjectContext?
    
    var id: String {
        source.identifier
    }
    
    init?(source: Source) {
        guard let context = source.managedObjectContext else{
            return nil
        }
        self.source = source
        self.context = context
    }
}
