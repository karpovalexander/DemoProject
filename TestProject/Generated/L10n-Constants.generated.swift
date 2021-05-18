// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
internal enum L10n {

  internal enum Error {
    /// Неизвестная ошибка. Попробуйте повторить попытку позднее
    internal static let somethingWentsWrong = L10n.tr("Localizable", "error.somethingWentsWrong")
  }

  internal enum Home {
    internal enum FilterCategory {
      /// Товары
      internal static let products = L10n.tr("Localizable", "home.filter-category.products")
      /// Магазины
      internal static let shops = L10n.tr("Localizable", "home.filter-category.shops")
      /// Топ 10
      internal static let top = L10n.tr("Localizable", "home.filter-category.top")
    }
    internal enum SearchBar {
      /// Поиск
      internal static let placeholder = L10n.tr("Localizable", "home.search-bar.placeholder")
    }
  }

  internal enum Info {
    /// Закрыть
    internal static let close = L10n.tr("Localizable", "info.close")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    // swiftlint:disable:next nslocalizedstring_key
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
