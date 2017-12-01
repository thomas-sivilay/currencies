import Foundation

public struct Currency {
    public let name: String
    public let currencyCode: String?
    public let currencySymbol: String?
    public let regionCode: String?
    public let regionName: String?
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
        let currencyCodes = NSLocale.commonISOCurrencyCodes
        let locales = NSLocale.availableLocaleIdentifiers.map { Locale(identifier: $0) }
        let deprecated = AdditionalCurrencies().deprecatedCommon()
        let missing = AdditionalCurrencies().missingCommon()

        for currencyCode in currencyCodes {
            if let locale = locales.filter({ $0.currencyCode == currencyCode }).first {
                guard let localizedCurrencyName = userLocale.localizedString(forCurrencyCode: currencyCode), let regionCode = locale.regionCode else {
                    continue
                }
                
                let currency = Currency(name: localizedCurrencyName,
                                        currencyCode: currencyCode,
                                        currencySymbol: locale.currencySymbol,
                                        regionCode: locale.regionCode,
                                        regionName: userLocale.localizedString(forRegionCode: regionCode),
                                        status: Currency.Status.available)
                currencies.append(currency)
            } else if showDeprecatedCurrencies, let currency = makeCurrency(from: deprecated, userLocale: userLocale, currencyCode: currencyCode) {
                currencies.append(currency)
            } else if let currency = makeCurrency(from: missing, userLocale: userLocale, currencyCode: currencyCode) {
                currencies.append(currency)
            } else {
                print("Missing \(currencyCode)")
            }
        }
        
        return currencies
    }
    
    private func makeCurrency(from additionalDic: [AdditionalCurrencies.CurrencyCode: AdditionalCurrencies.CurrencyInfo], userLocale: Locale, currencyCode: AdditionalCurrencies.CurrencyCode) -> Currency? {
        guard let info = additionalDic[currencyCode], let localizedCurrencyName = userLocale.localizedString(forCurrencyCode: currencyCode) else {
            return nil
        }
        
        return Currency(name: localizedCurrencyName,
                        currencyCode: currencyCode,
                        currencySymbol: info.currencySymbol,
                        regionCode: info.regionCode,
                        regionName: userLocale.localizedString(forRegionCode: info.regionCode),
                        status: Currency.Status.replaced(byCurrencyCode: info.replaceByCurrencyCode))
    }
}
