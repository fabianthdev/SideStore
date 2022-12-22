// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  internal enum BrowseView {
    /// Search
    internal static let search = L10n.tr("Localizable", "BrowseView.search", fallback: "Search")
    /// BrowseView
    internal static let title = L10n.tr("Localizable", "BrowseView.title", fallback: "Browse")
    internal enum Actions {
      /// Sources
      internal static let sources = L10n.tr("Localizable", "BrowseView.Actions.sources", fallback: "Sources")
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
