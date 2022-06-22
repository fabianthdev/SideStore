//
//  ALTApplication+AltStoreApp.swift
//  AltStore
//
//  Created by Riley Testut on 11/11/20.
//  Copyright © 2020 Riley Testut. All rights reserved.
//

import AltSign
import Constants

extension ALTApplication
{
    static let altstoreBundleID = Constants.kProductBundleIdentifier

    var isAltStoreApp: Bool {
        let isAltStoreApp = self.bundleIdentifier.contains(ALTApplication.altstoreBundleID)
        return isAltStoreApp
    }
}
