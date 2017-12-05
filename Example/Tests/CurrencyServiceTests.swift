import XCTest
import Currencies

final class CurrencyServiceTests: XCTestCase {

    let service = CurrencyService()

    func testReturn250() {
        let res = service.getCommonCurrencies()
        XCTAssertEqual(res.count, 250)
    }
    
    func testReturnDeprecated() {
        let res = service.getCommonCurrencies(showDeprecatedCurrencies: true)
        XCTAssertEqual(res.count, 257)
    }
    
    func testHasAllCommonCurrencyCode() {
        let res: [String] = service.getCommonCurrencies(showDeprecatedCurrencies: true).map { $0.currencyCode ?? "" }
        let set = Set(res)
        
        for currencyCode in Locale.commonISOCurrencyCodes {
            XCTAssertTrue(res.contains(currencyCode), "Can't find currency code \(currencyCode)")
        }
        
        XCTAssertEqual(set.count - 1, Locale.commonISOCurrencyCodes.count)
    }
    
//    func testHasAllRegionCode() {
//        let res: [String] = service.getCommonCurrencies(showDeprecatedCurrencies: true).map { $0.regionCode ?? "" }
//        let set = Set(res)
//
//        for regionCode in Locale.isoRegionCodes {
//            XCTAssertTrue(res.contains(regionCode), "Can't find region code \(regionCode)")
//        }
//
//        XCTAssertEqual(set.count - 1, Locale.isoRegionCodes.count)
//    }
}
