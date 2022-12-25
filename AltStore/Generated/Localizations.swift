// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  internal enum AddSourceView {
    /// Continue
    internal static let `continue` = L10n.tr("Localizable", "AddSourceView.continue", fallback: "Continue")
    /// AddSourceView
    internal static let sourceURL = L10n.tr("Localizable", "AddSourceView.sourceURL", fallback: "Source URL")
    /// Please enter the source url here. Then, tap continue to validate and add the source in the next step.
    internal static let sourceWarning = L10n.tr("Localizable", "AddSourceView.sourceWarning", fallback: "Please enter the source url here. Then, tap continue to validate and add the source in the next step.")
    /// Be careful with unvalidated third-party sources! Make sure to only add sources that you trust.
    internal static let sourceWarningContinued = L10n.tr("Localizable", "AddSourceView.sourceWarningContinued", fallback: "Be careful with unvalidated third-party sources! Make sure to only add sources that you trust.")
    /// Add Source
    internal static let title = L10n.tr("Localizable", "AddSourceView.title", fallback: "Add Source")
  }
  internal enum AppAction {
    /// Activate
    internal static let activate = L10n.tr("Localizable", "AppAction.activate", fallback: "Activate")
    /// Backup
    internal static let backup = L10n.tr("Localizable", "AppAction.backup", fallback: "Backup")
    /// Customize icon
    internal static let chooseCustomIcon = L10n.tr("Localizable", "AppAction.chooseCustomIcon", fallback: "Customize icon")
    /// Deactivate
    internal static let deactivate = L10n.tr("Localizable", "AppAction.deactivate", fallback: "Deactivate")
    /// Activate JIT
    internal static let enableJIT = L10n.tr("Localizable", "AppAction.enableJIT", fallback: "Activate JIT")
    /// Export backup
    internal static let exportBackup = L10n.tr("Localizable", "AppAction.exportBackup", fallback: "Export backup")
    /// AppAction
    internal static let install = L10n.tr("Localizable", "AppAction.install", fallback: "Install")
    /// Open
    internal static let `open` = L10n.tr("Localizable", "AppAction.open", fallback: "Open")
    /// Refresh
    internal static let refresh = L10n.tr("Localizable", "AppAction.refresh", fallback: "Refresh")
    /// Remove
    internal static let remove = L10n.tr("Localizable", "AppAction.remove", fallback: "Remove")
    /// Reset icon
    internal static let resetIcon = L10n.tr("Localizable", "AppAction.resetIcon", fallback: "Reset icon")
    /// Restore backup
    internal static let restoreBackup = L10n.tr("Localizable", "AppAction.restoreBackup", fallback: "Restore backup")
  }
  internal enum AppDetailView {
    /// AppDetailView
    internal static let more = L10n.tr("Localizable", "AppDetailView.more", fallback: "More...")
    /// The app requires no permissions.
    internal static let noPermissions = L10n.tr("Localizable", "AppDetailView.noPermissions", fallback: "The app requires no permissions.")
    /// No version information
    internal static let noVersionInformation = L10n.tr("Localizable", "AppDetailView.noVersionInformation", fallback: "No version information")
    /// Permissions
    internal static let permissions = L10n.tr("Localizable", "AppDetailView.permissions", fallback: "Permissions")
    /// Version
    internal static let version = L10n.tr("Localizable", "AppDetailView.version", fallback: "Version")
    /// What's New
    internal static let whatsNew = L10n.tr("Localizable", "AppDetailView.whatsNew", fallback: "What's New")
  }
  internal enum AppPermissionGrid {
    /// AppPermissionGrid
    internal static let usageDescription = L10n.tr("Localizable", "AppPermissionGrid.usageDescription", fallback: "Usage Description")
  }
  internal enum AppPillButton {
    /// AppPillButton
    internal static let free = L10n.tr("Localizable", "AppPillButton.free", fallback: "Free")
    /// Open
    internal static let `open` = L10n.tr("Localizable", "AppPillButton.open", fallback: "Open")
  }
  internal enum BrowseView {
    /// Search
    internal static let search = L10n.tr("Localizable", "BrowseView.search", fallback: "Search")
    /// BrowseView
    internal static let title = L10n.tr("Localizable", "BrowseView.title", fallback: "Browse")
    internal enum Actions {
      /// Sources
      internal static let sources = L10n.tr("Localizable", "BrowseView.Actions.sources", fallback: "Sources")
    }
    internal enum Categories {
      /// Games and
      /// Emulators
      internal static let gamesAndEmulators = L10n.tr("Localizable", "BrowseView.Categories.gamesAndEmulators", fallback: "Games and\nEmulators")
    }
    internal enum Section {
      internal enum AllApps {
        /// All Apps
        internal static let title = L10n.tr("Localizable", "BrowseView.Section.AllApps.title", fallback: "All Apps")
      }
      internal enum PromotedCategories {
        /// Show all
        internal static let showAll = L10n.tr("Localizable", "BrowseView.Section.PromotedCategories.showAll", fallback: "Show all")
        /// Promoted Categories
        internal static let title = L10n.tr("Localizable", "BrowseView.Section.PromotedCategories.title", fallback: "Promoted Categories")
      }
    }
  }
  internal enum ConfirmAddSourceView {
    /// Add Source
    internal static let addSource = L10n.tr("Localizable", "ConfirmAddSourceView.addSource", fallback: "Add Source")
    /// ConfirmAddSourceView
    internal static let apps = L10n.tr("Localizable", "ConfirmAddSourceView.apps", fallback: "Apps")
    /// News Items
    internal static let newsItems = L10n.tr("Localizable", "ConfirmAddSourceView.newsItems", fallback: "News Items")
    /// Source Contents
    internal static let sourceContents = L10n.tr("Localizable", "ConfirmAddSourceView.sourceContents", fallback: "Source Contents")
    /// Source Identifier
    internal static let sourceIdentifier = L10n.tr("Localizable", "ConfirmAddSourceView.sourceIdentifier", fallback: "Source Identifier")
    /// Source Information
    internal static let sourceInfo = L10n.tr("Localizable", "ConfirmAddSourceView.sourceInfo", fallback: "Source Information")
    /// Source URL
    internal static let sourceURL = L10n.tr("Localizable", "ConfirmAddSourceView.sourceURL", fallback: "Source URL")
  }
  internal enum ConnectAppleIDView {
    /// Apple ID
    internal static let appleID = L10n.tr("Localizable", "ConnectAppleIDView.appleID", fallback: "Apple ID")
    /// Cancel
    internal static let cancel = L10n.tr("Localizable", "ConnectAppleIDView.cancel", fallback: "Cancel")
    /// Connect Your Apple ID
    internal static let connectYourAppleID = L10n.tr("Localizable", "ConnectAppleIDView.connectYourAppleID", fallback: "Connect Your Apple ID")
    /// Failed to Sign In
    internal static let failedToSignIn = L10n.tr("Localizable", "ConnectAppleIDView.failedToSignIn", fallback: "Failed to Sign In")
    /// Your Apple ID is used to configure apps so they can be installed on this device. Your credentials will be stored securely in this device's Keychain and sent only to Apple for authentication.
    internal static let footer = L10n.tr("Localizable", "ConnectAppleIDView.footer", fallback: "Your Apple ID is used to configure apps so they can be installed on this device. Your credentials will be stored securely in this device's Keychain and sent only to Apple for authentication.")
    /// Password
    internal static let password = L10n.tr("Localizable", "ConnectAppleIDView.password", fallback: "Password")
    /// Sign In
    internal static let signIn = L10n.tr("Localizable", "ConnectAppleIDView.signIn", fallback: "Sign In")
    /// ConnectAppleIDView
    internal static let startWithSignIn = L10n.tr("Localizable", "ConnectAppleIDView.startWithSignIn", fallback: "Sign in with your Apple ID to get started.")
    /// Why do we need this?
    internal static let whyDoWeNeedThis = L10n.tr("Localizable", "ConnectAppleIDView.whyDoWeNeedThis", fallback: "Why do we need this?")
  }
  internal enum MyAppsView {
    /// MyAppsView
    internal static let active = L10n.tr("Localizable", "MyAppsView.active", fallback: "Active")
    /// App IDs Remaining
    internal static let appIDsRemaining = L10n.tr("Localizable", "MyAppsView.appIDsRemaining", fallback: "App IDs Remaining")
    /// apps
    internal static let apps = L10n.tr("Localizable", "MyAppsView.apps", fallback: "apps")
    /// Failed to refresh
    internal static let failedToRefresh = L10n.tr("Localizable", "MyAppsView.failedToRefresh", fallback: "Failed to refresh")
    /// My Apps
    internal static let myApps = L10n.tr("Localizable", "MyAppsView.myApps", fallback: "My Apps")
    /// No Updates Available
    internal static let noUpdatesAvailable = L10n.tr("Localizable", "MyAppsView.noUpdatesAvailable", fallback: "No Updates Available")
    /// Refresh All
    internal static let refreshAll = L10n.tr("Localizable", "MyAppsView.refreshAll", fallback: "Refresh All")
    /// Active
    internal static let remainingAppID = L10n.tr("Localizable", "MyAppsView.remainingAppID", fallback: "Active")
    /// Sideloading in progress...
    internal static let sideloading = L10n.tr("Localizable", "MyAppsView.sideloading", fallback: "Sideloading in progress...")
    /// Keep this lowercase
    internal static let viewAppIDs = L10n.tr("Localizable", "MyAppsView.viewAppIDs", fallback: "View App IDs")
  }
  internal enum NewsView {
    /// NewsView
    internal static let title = L10n.tr("Localizable", "NewsView.title", fallback: "News")
    internal enum Section {
      internal enum FromSources {
        /// From your Sources
        internal static let title = L10n.tr("Localizable", "NewsView.Section.FromSources.title", fallback: "From your Sources")
      }
    }
  }
  internal enum RootView {
    /// Browse
    internal static let browse = L10n.tr("Localizable", "RootView.browse", fallback: "Browse")
    /// My Apps
    internal static let myApps = L10n.tr("Localizable", "RootView.myApps", fallback: "My Apps")
    /// RootView
    internal static let news = L10n.tr("Localizable", "RootView.news", fallback: "News")
    /// Settings
    internal static let settings = L10n.tr("Localizable", "RootView.settings", fallback: "Settings")
  }
  internal enum SettingsView {
    /// Add to Siri...
    internal static let addToSiri = L10n.tr("Localizable", "SettingsView.addToSiri", fallback: "Add to Siri...")
    /// Background Refresh
    internal static let backgroundRefresh = L10n.tr("Localizable", "SettingsView.backgroundRefresh", fallback: "Background Refresh")
    /// Connect your Apple ID
    internal static let connectAppleID = L10n.tr("Localizable", "SettingsView.connectAppleID", fallback: "Connect your Apple ID")
    /// Credits
    internal static let credits = L10n.tr("Localizable", "SettingsView.credits", fallback: "Credits")
    /// Debug
    internal static let debug = L10n.tr("Localizable", "SettingsView.debug", fallback: "Debug")
    /// Refreshing Apps
    internal static let refreshingApps = L10n.tr("Localizable", "SettingsView.refreshingApps", fallback: "Refreshing Apps")
    /// Enable Background Refresh to automatically refresh apps in the background when connected to WiFi and with Wireguard active.
    internal static let refreshingAppsFooter = L10n.tr("Localizable", "SettingsView.refreshingAppsFooter", fallback: "Enable Background Refresh to automatically refresh apps in the background when connected to WiFi and with Wireguard active.")
    /// Reset Image Cache
    internal static let resetImageCache = L10n.tr("Localizable", "SettingsView.resetImageCache", fallback: "Reset Image Cache")
    /// SwiftUI Redesign
    internal static let swiftUIRedesign = L10n.tr("Localizable", "SettingsView.swiftUIRedesign", fallback: "SwiftUI Redesign")
    /// Switch to UIKit
    internal static let switchToUIKit = L10n.tr("Localizable", "SettingsView.switchToUIKit", fallback: "Switch to UIKit")
    /// Settings
    internal static let title = L10n.tr("Localizable", "SettingsView.title", fallback: "Settings")
    internal enum ConnectedAppleID {
      /// E-Mail
      internal static let eMail = L10n.tr("Localizable", "SettingsView.ConnectedAppleID.eMail", fallback: "E-Mail")
      /// SettingsView
      internal static let name = L10n.tr("Localizable", "SettingsView.ConnectedAppleID.name", fallback: "Name")
      /// Sign Out
      internal static let signOut = L10n.tr("Localizable", "SettingsView.ConnectedAppleID.signOut", fallback: "Sign Out")
      /// Connected Apple ID
      internal static let text = L10n.tr("Localizable", "SettingsView.ConnectedAppleID.text", fallback: "Connected Apple ID")
      /// Type
      internal static let type = L10n.tr("Localizable", "SettingsView.ConnectedAppleID.type", fallback: "Type")
      internal enum Footer {
        /// Your Apple ID is required to sign the apps you install with SideStore.
        internal static let p1 = L10n.tr("Localizable", "SettingsView.ConnectedAppleID.Footer.p1", fallback: "Your Apple ID is required to sign the apps you install with SideStore.")
        /// Your credentials are only sent to Apple's servers and are not accessible by the SideStore Team. Once successfully logged in, the login details are stored securely on your device.
        internal static let p2 = L10n.tr("Localizable", "SettingsView.ConnectedAppleID.Footer.p2", fallback: "Your credentials are only sent to Apple's servers and are not accessible by the SideStore Team. Once successfully logged in, the login details are stored securely on your device.")
      }
    }
  }
  internal enum SourcesView {
    /// Done
    internal static let done = L10n.tr("Localizable", "SourcesView.done", fallback: "Done")
    /// Remove
    internal static let remove = L10n.tr("Localizable", "SourcesView.remove", fallback: "Remove")
    /// SideStore has reviewed these sources to make sure they meet our safety standards.
    internal static let reviewedText = L10n.tr("Localizable", "SourcesView.reviewedText", fallback: "SideStore has reviewed these sources to make sure they meet our safety standards.")
    /// Sources
    internal static let sources = L10n.tr("Localizable", "SourcesView.sources", fallback: "Sources")
    /// SourcesView
    internal static let sourcesDescription = L10n.tr("Localizable", "SourcesView.sourcesDescription", fallback: "Sources control what apps are available to download through SideStore.")
    /// Trusted Sources
    internal static let trustedSources = L10n.tr("Localizable", "SourcesView.trustedSources", fallback: "Trusted Sources")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
