import XCTest

class Tests: XCTestCase {
    
    let rentlio = RentlioApi(apikey: "your_apikey")
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testApiKey() {
        XCTAssertNotNil(rentlio.apikey, "apikey is nil")
    }
    
    func testBaseUrl() {
        XCTAssertNotNil(rentlio.baseUrl, "baseUrl is nil")
        XCTAssertEqual(rentlio.baseUrl, "https://api.rentl.io/v1/", "invalid base url")
    }
    
    func testEndpoint() {
        let endpoint1 = rentlio.endpoint(url: "users/me")
        let endpoint2 = rentlio.endpoint(url: "reservations", data: ["perPage": "10", "page": "1"])
        
        XCTAssertEqual(endpoint1, "https://api.rentl.io/v1/users/me?apikey=your_apikey", "invalid endpoint")
        XCTAssertEqual(endpoint2, "https://api.rentl.io/v1/reservations?apikey=your_apikey&perPage=10&page=1", "invalid endpoint")
    }
    
    func testParams() {
        let params = ["perPage": "10", "page": "1"]
        let paramsStr = rentlio.params(data: params)
        
        XCTAssertEqual(paramsStr, "&perPage=10&page=1", "invalid params string")
    }
    
    func testSanitizeParam() {
        let param = " Full Name   "
        let sanitizedParam = rentlio.sanitizeParam(value: param)
        
        XCTAssertEqual(sanitizedParam, "Full%20Name", "invalid sanitized param")
    }
    
}
