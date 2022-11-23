//
//  MyAppsView.swift
//  SideStoreUI
//
//  Created by Fabian Thies on 18.11.22.
//  Copyright © 2022 Fabian Thies. All rights reserved.
//

import SwiftUI

struct MyAppsView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                
            }
        }
        .background(Color(UIColor.systemGroupedBackground).ignoresSafeArea())
        .navigationTitle("My Apps")
    }
}

struct MyAppsView_Previews: PreviewProvider {
    static var previews: some View {
        MyAppsView()
    }
}
