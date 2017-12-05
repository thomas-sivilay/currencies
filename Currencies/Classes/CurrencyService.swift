import Foundation

public struct Currency {
    public let name: String
    public let currencyCode: String?
    public let currencySymbol: String?
    public let regionCode: String?
    public let regionName: String?
    public let localeIdentifier: String?
    public let status: Status
    
    public enum Status {
        case available
        case replaced(byCurrencyCode: String)
    }
}

public class CurrencyService {
    
    public init() {
    }
    
    public func getCommonCurrencies(userLocale: Locale = NSLocale.current, showDeprecatedCurrencies: Bool = false) -> [Currency] {
        var currencies = [Currency]()
        let locales = NSLocale.availableLocaleIdentifiers.map { Locale(identifier: $0) }
        let localesHash = Dictionary(grouping: locales) { locale -> String in
            return locale.regionCode ?? ""
        }
        let deprecated = AdditionalCurrencies().deprecatedCommon()
        let missing = AdditionalCurrencies().missingCommon()
        
        for regionCode in Locale.isoRegionCodes {
            if let locales = localesHash[regionCode] {
                if let locale = locales.first, let currencyCode = locale.currencyCode {
                    guard let localizedCurrencyName = userLocale.localizedString(forCurrencyCode: currencyCode), let regionCode = locale.regionCode else {
                        continue
                    }
                    
                    let currency = Currency(name: localizedCurrencyName,
                                            currencyCode: currencyCode,
                                            currencySymbol: locale.currencySymbol,
                                            regionCode: locale.regionCode,
                                            regionName: userLocale.localizedString(forRegionCode: regionCode),
                                            localeIdentifier: locale.identifier,
                                            status: Currency.Status.available)
                    currencies.append(currency)
                }
            }
            
            if missing.keys.contains(regionCode) {
                if let currency = makeCurrency(from: missing, userLocale: userLocale, regionCode: regionCode) {
                    currencies.append(currency)
                }
            }
        }
        
        if showDeprecatedCurrencies {
            for regionCode in deprecated.keys {
                if let currency = makeCurrency(from: deprecated, userLocale: userLocale, regionCode: regionCode) {
                    currencies.append(currency)
                }
            }
        }
        
        return currencies
    }
    
    private func makeCurrency(from additionalDic: [AdditionalCurrencies.RegionCode: AdditionalCurrencies.CurrencyInfo], userLocale: Locale, regionCode: AdditionalCurrencies.RegionCode) -> Currency? {
        guard let info = additionalDic[regionCode], let localizedCurrencyName = userLocale.localizedString(forCurrencyCode: info.currencyCode) else {
            return nil
        }
        
        return Currency(name: localizedCurrencyName,
                        currencyCode: info.currencyCode,
                        currencySymbol: info.currencySymbol,
                        regionCode: info.regionCode,
                        regionName: userLocale.localizedString(forRegionCode: info.regionCode),
                        localeIdentifier: info.localeIdentifier,
                        status: Currency.Status.replaced(byCurrencyCode: info.replaceByCurrencyCode))
    }
}


