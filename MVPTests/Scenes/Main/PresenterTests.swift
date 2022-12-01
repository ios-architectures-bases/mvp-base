import XCTest

@testable import MVP

final class PresenterTests: XCTestCase {
    
    var sut: Presenter!
    var viewControllerSpy: ViewControllerSpy!
    var networkMock: NetworkMock!
    
    override func setUp() {
        viewControllerSpy = ViewControllerSpy()
        networkMock = NetworkMock()
        sut = Presenter(network: networkMock)
        sut.viewController = viewControllerSpy
    } 

    override func tearDown() {
        viewControllerSpy = nil
        sut = nil
        networkMock = nil
    }

    func test_init_shouldBeAKinfOfPresenterType() {
        XCTAssertTrue(sut is PresenterType)
    }
    
    func test_loadData_whenResultIsSuccess_shouldReturnCorrectlyReadyState() {
        sut.loadData()

        let expectedValue: [ViewState] = [.loading, .ready("Mock result")]
        
        XCTAssertEqual(viewControllerSpy.showArgs, expectedValue)
    }
    
    func test_loadData_whenResultIsFailure_shouldReturnCorrectlyErrorState() {
        networkMock.returnedResult = .failure(.networkError)
        
        sut.loadData()

        let expectedValue: [ViewState] = [.loading, .error]
        
        XCTAssertEqual(viewControllerSpy.showArgs, expectedValue)
    }

    
    func test_tryAgain_shouldRepeateLoadDataFlowCorrectly() {
        networkMock.returnedResult = .failure(.networkError)
        
        sut.tryAgain()
        
        let expectedValue: [ViewState] = [.loading, .error]
        
        XCTAssertEqual(viewControllerSpy.showArgs.count, 2)
        XCTAssertEqual(viewControllerSpy.showArgs, expectedValue)
    }
}
