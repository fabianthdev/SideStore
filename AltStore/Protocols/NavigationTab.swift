//
//  NavigationTab.swift
//  SideStoreUI
//
//  Created by Fabian Thies on 18.11.22.
//  Copyright © 2022 Fabian Thies. All rights reserved.
//

import Foundation

protocol NavigationTab: RawRepresentable, Identifiable, CaseIterable, Hashable where RawValue == Int {
    static var defaultTab: Self { get }
    var displaySymbol: String { get }
    var displayName: String { get }
}

extension NavigationTab {
    var id: Int {
        self.rawValue
    }
}
