//
//  AddSourceView.swift
//  SideStore
//
//  Created by Fabian Thies on 20.11.22.
//  Copyright © 2022 Fabian Thies. All rights reserved.
//

import SwiftUI

struct AddSourceView: View {
    
    @State var sourceUrlText: String = ""
    
    var continueHandler: (_ urlText: String) -> ()
    
    var body: some View {
        List {
            Section {
                TextField("https://connect.altstore.ml", text: $sourceUrlText)
                    .keyboardType(.URL)
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
            } header: {
                Text("Source URL")
            } footer: {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Please enter the source url here. Then, tap continue to validate and add the source in the next step.")
                    
                    HStack(alignment: .top) {
                        Image(systemName: "exclamationmark.triangle.fill")
                        
                        Text("Be careful with unvalidated third-party sources! Make sure to only add sources that you trust.")
                    }
                }
            }
            
            SwiftUI.Button {
                self.continueHandler(self.sourceUrlText)
            } label: {
                Text("Continue")
            }
            .disabled(URL(string: self.sourceUrlText)?.host == nil)
        }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle("Add Source")
    }
}

struct AddSourceView_Previews: PreviewProvider {
    static var previews: some View {
        AddSourceView(continueHandler: { _ in })
    }
}
