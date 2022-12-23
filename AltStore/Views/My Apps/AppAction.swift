//
//  AppAction.swift
//  SideStore
//
//  Created by Fabian Thies on 20.12.22.
//  Copyright © 2022 SideStore. All rights reserved.
//

import Foundation
import SFSafeSymbols

enum AppAction: Int, CaseIterable {
    case install, open, refresh
    case activate, deactivate
    case remove
    case enableJIT
    case backup, exportBackup, restoreBackup
    case chooseCustomIcon, resetCustomIcon
    
    
    var title: String {
        switch self {
        case .install: return "Install"
        case .open: return "Open"
        case .refresh: return "Refresh"
        case .activate: return "Activate"
        case .deactivate: return "Deactivate"
        case .remove: return "Remove"
        case .enableJIT: return "Enable JIT"
        case .backup: return "Back Up"
        case .exportBackup: return "Export Backup"
        case .restoreBackup: return "Restore Backup"
        case .chooseCustomIcon: return "Change Icon"
        case .resetCustomIcon: return "Reset Icon"
        }
    }
    
    var symbol: SFSymbol {
        switch self {
        case .install: return .squareAndArrowDown
        case .open: return .arrowUpForwardApp
        case .refresh: return .arrowClockwise
        case .activate: return .checkmarkCircle
        case .deactivate: return .xmarkCircle
        case .remove: return .trash
        case .enableJIT: return .bolt
        case .backup: return .docOnDoc
        case .exportBackup: return .arrowUpDoc
        case .restoreBackup: return .arrowDownDoc
        case .chooseCustomIcon: return .photo
        case .resetCustomIcon: return .arrowUturnLeft
        }
    }
}
