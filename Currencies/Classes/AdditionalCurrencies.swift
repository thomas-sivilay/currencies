import Foundation

struct AdditionalCurrencies {
    typealias CurrencyCode = String
    
    struct CurrencyInfo {
        let currencyCode: String
        let currencySymbol: String
        let replaceByCurrencyCode: String
        let regionCode: String
        let localeIdentifier: String
    }

    func missingCommon() -> [CurrencyCode: CurrencyInfo] {
        let cucInfo = CurrencyInfo(currencyCode: "CUC", currencySymbol: "$CUC", replaceByCurrencyCode: "", regionCode: "CUB", localeIdentifier: "es_CU")
        let lslInfo = CurrencyInfo(currencyCode: "LSL", currencySymbol: "LSL", replaceByCurrencyCode: "", regionCode: "LSO", localeIdentifier: "en_US")
        return [
            "CUC" : cucInfo,
            "LSL" : lslInfo
        ]
    }
    
    func deprecatedCommon() -> [CurrencyCode: CurrencyInfo] {
        let byrInfo = CurrencyInfo(currencyCode: "BYR", currencySymbol: "Br", replaceByCurrencyCode: "BYN", regionCode: "BLR", localeIdentifier: "be_BY")
        let ltlInfo = CurrencyInfo(currencyCode: "LTL", currencySymbol: "LTL", replaceByCurrencyCode: "EUR", regionCode: "LTU", localeIdentifier: "lt_LT")
        let lvlInfo = CurrencyInfo(currencyCode: "LVL", currencySymbol: "LVL", replaceByCurrencyCode: "EUR", regionCode: "LVA", localeIdentifier: "lv_LV")
        let mzeInfo = CurrencyInfo(currencyCode: "MZE", currencySymbol: "MZE", replaceByCurrencyCode: "MZM", regionCode: "MOZ", localeIdentifier: "pt_MZ")
        let skkInfo = CurrencyInfo(currencyCode: "SKK", currencySymbol: "SKK", replaceByCurrencyCode: "EUR", regionCode: "SVK", localeIdentifier: "sk_SK")
        let svcInfo = CurrencyInfo(currencyCode: "SVC", currencySymbol: "SVC", replaceByCurrencyCode: "USD", regionCode: "SLV", localeIdentifier: "es_SV")
        let gwpInfo = CurrencyInfo(currencyCode: "GWP", currencySymbol: "GWP", replaceByCurrencyCode: "XOF", regionCode: "GNB", localeIdentifier: "pt_GW")
        return [
            "BYR" : byrInfo,
            "LTL" : ltlInfo,
            "LVL" : lvlInfo,
            "MZE" : mzeInfo,
            "SKK" : skkInfo,
            "SVC" : svcInfo,
            "GWP" : gwpInfo,
        ]
    }
}
