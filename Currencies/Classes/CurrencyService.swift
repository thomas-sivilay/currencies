import Foundation

public struct Currency {
    public let name: String
    public let currencyCode: String?
    public let currencySymbol: String?
    public let regionCode: String?
    public let regionName: String?
    public let deprecated: Bool
    public let repacedByCurrencyCode: String?
}

public class CurrencyService {
    
    public init() {
    }
    
    public func getCommonCurrencies(userLocale: Locale = NSLocale.current, showDeprecatedCurrencies: Bool = false) -> [Currency] {
        var currencies = [Currency]()
        let currencyCodes = NSLocale.commonISOCurrencyCodes
        let locales = NSLocale.availableLocaleIdentifiers.map { Locale(identifier: $0) }
        let deprecated = AdditionalCurrencies().deprecatedCommon()
        let missing = AdditionalCurrencies().missingCommon()

        for currencyCode in currencyCodes {
            if let locale = locales.filter({ $0.currencyCode == currencyCode }).first {
                let currency = Currency(name: userLocale.localizedString(forCurrencyCode: currencyCode)!,
                                        currencyCode: currencyCode,
                                        currencySymbol: locale.currencySymbol,
                                        regionCode: locale.regionCode,
                                        regionName: userLocale.localizedString(forRegionCode: locale.regionCode!),
                                        deprecated: false,
                                        repacedByCurrencyCode: nil)
                currencies.append(currency)
            } else if showDeprecatedCurrencies, let info = deprecated[currencyCode] {
                let currency = Currency(name: userLocale.localizedString(forCurrencyCode: currencyCode)!,
                                        currencyCode: currencyCode,
                                        currencySymbol: info.currencySymbol,
                                        regionCode: info.regionCode,
                                        regionName: userLocale.localizedString(forRegionCode: info.regionCode),
                                        deprecated: true,
                                        repacedByCurrencyCode: info.replaceByCurrencyCode)
                currencies.append(currency)
            } else if let info = missing[currencyCode] {
                let currency = Currency(name: userLocale.localizedString(forCurrencyCode: currencyCode)!,
                                        currencyCode: currencyCode,
                                        currencySymbol: info.currencySymbol,
                                        regionCode: info.regionCode,
                                        regionName: userLocale.localizedString(forRegionCode: info.regionCode),
                                        deprecated: false,
                                        repacedByCurrencyCode: nil)
                currencies.append(currency)
            } else {
                print("Missing \(currencyCode)")
            }
        }
        
        return currencies
    }
}
