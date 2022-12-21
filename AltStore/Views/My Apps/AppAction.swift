//
//  AppAction.swift
//  SideStore
//
//  Created by Fabian Thies on 20.12.22.
//  Copyright © 2022 SideStore. All rights reserved.
//

import Foundation

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
    
    var imageName: String {
        switch self {
        case .install: return "Install"
        case .open: return "arrow.up.forward.app"
        case .refresh: return "arrow.clockwise"
        case .activate: return "checkmark.circle"
        case .deactivate: return "xmark.circle"
        case .remove: return "trash"
        case .enableJIT: return "bolt"
        case .backup: return "doc.on.doc"
        case .exportBackup: return "arrow.up.doc"
        case .restoreBackup: return "arrow.down.doc"
        case .chooseCustomIcon: return "photo"
        case .resetCustomIcon: return "arrow.uturn.left"
        }
    }
}
