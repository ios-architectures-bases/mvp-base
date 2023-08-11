import XCTest

@testable import MVP

final class NetworkTests: XCTestCase {
    
    var sut: Network!
    var apiServiceMock: APIMock!

    override func setUp() {
        apiServiceMock = APIMock()
        sut = Network(APIService: apiServiceMock)
    }

    override func tearDown() {
        sut = nil
        apiServiceMock = nil
    }
    
    func test_fetchStatus_whenReceiveNotNilText_returnCorrectString() {
        let expectedValue = "Tudo certo por aqui"
        apiServiceMock.returnedString = "Tudo certo por aqui"

        let expectation = XCTestExpectation(description: "get correctly status asynchronously.")
        
        sut.fetchStatus { result in
            XCTAssertEqual(result, .success(expectedValue))
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2.0)
    }
    
    func test_fetchStatus_whenReceiveNotText_returnCorrectError() {
        let expectedValue: CustomError = .networkError

        let expectation = XCTestExpectation(description: "get correctly status asynchronously.")
        
        sut.fetchStatus { result in
            XCTAssertEqual(result, .failure(expectedValue))
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2.0)
    }
}
