import Foundation

struct AdditionalCurrencies {
    typealias CurrencyCode = String
    
    struct CurrencyInfo {
        let currencyCode: String
        let currencySymbol: String
        let replaceByCurrencyCode: String
        let regionCode: String
    }

    func missingCommon() -> [CurrencyCode: CurrencyInfo] {
        let cucInfo = CurrencyInfo(currencyCode: "CUC", currencySymbol: "$CUC", replaceByCurrencyCode: "", regionCode: "CUB")
        let lslInfo = CurrencyInfo(currencyCode: "LSL", currencySymbol: "LSL", replaceByCurrencyCode: "", regionCode: "LSO")
        
        return [
            "CUC" : cucInfo,
            "LSL" : lslInfo
        ]
    }
    
    func deprecatedCommon() -> [CurrencyCode: CurrencyInfo] {
        let byrInfo = CurrencyInfo(currencyCode: "BYR", currencySymbol: "Br", replaceByCurrencyCode: "BYN", regionCode: "BLR")
        let ltlInfo = CurrencyInfo(currencyCode: "LTL", currencySymbol: "LTL", replaceByCurrencyCode: "EUR", regionCode: "LTU")
        let lvlInfo = CurrencyInfo(currencyCode: "LVL", currencySymbol: "LVL", replaceByCurrencyCode: "EUR", regionCode: "LVA")
        let mzeInfo = CurrencyInfo(currencyCode: "MZE", currencySymbol: "MZE", replaceByCurrencyCode: "MZM", regionCode: "MOZ")
        let skkInfo = CurrencyInfo(currencyCode: "SKK", currencySymbol: "SKK", replaceByCurrencyCode: "EUR", regionCode: "SVK")
        let svcInfo = CurrencyInfo(currencyCode: "SVC", currencySymbol: "SVC", replaceByCurrencyCode: "USD", regionCode: "SLV")
        let gwpInfo = CurrencyInfo(currencyCode: "GWP", currencySymbol: "GWP", replaceByCurrencyCode: "XOF", regionCode: "GNB")
        
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
