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
        case .install: return L10n.AppAction.install
        case .open: return L10n.AppAction.open
        case .refresh: return L10n.AppAction.refresh
        case .activate: return L10n.AppAction.activate
        case .deactivate: return L10n.AppAction.deactivate
        case .remove: return L10n.AppAction.remove
        case .enableJIT: return L10n.AppAction.enableJIT
        case .backup: return L10n.AppAction.backup
        case .exportBackup: return L10n.AppAction.exportBackup
        case .restoreBackup: return L10n.AppAction.restoreBackup
        case .chooseCustomIcon: return L10n.AppAction.chooseCustomIcon
        case .resetCustomIcon: return L10n.AppAction.resetIcon
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
