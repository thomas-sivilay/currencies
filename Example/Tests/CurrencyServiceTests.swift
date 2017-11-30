import XCTest
import Currencies

final class CurrencyServiceTests: XCTestCase {

    let service = CurrencyService()

    func testReturn154() {
        let res = service.getCommonCurrencies()
        XCTAssertEqual(res.count, 154)
    }
    
    func testReturnDeprecated() {
        let res = service.getCommonCurrencies(showDeprecatedCurrencies: true)
        XCTAssertEqual(res.count, NSLocale.commonISOCurrencyCodes.count)
    }
}
