//import XCTest
//
//@testable import MVP
//
//final class PresenterTests: XCTestCase {
//
//    var sut: Presenter!
//    var viewControllerSpy: ViewControllerSpy!
//    var dispatchQueueMock: DispatchQueueMock!
//
//    override func setUp() {
//        dispatchQueueMock = DispatchQueueMock()
//        viewControllerSpy = ViewControllerSpy()
//
//        createSut()
//    }
//
//    override func tearDown() {
//        viewControllerSpy = nil
//        sut = nil
//    }
//
//    func test_init_shouldBeAKinfOfPresenterType() {
//        XCTAssertTrue(sut is PresenterType)
//    }
//
//    func test_loadData_whenStatusIsFalse_shouldCallViewControllerFunctionShow() {
//        sut.loadData()
//
//        XCTAssertEqual(viewControllerSpy.showArgs.count, 2)
//    }
//
//    func test_loadData_whenStatusIsFalse_shouldCallViewControllerFunctionShowWithCorrectValues() {
//        sut.loadData()
//
//        let expectedValue: [ViewState] = [.loading, .error]
//
//        XCTAssertEqual(viewControllerSpy.showArgs, expectedValue)
//    }
//
//    func test_loadData_whenStatusIsTrue_shouldCallViewControllerFunctionShow() {
//        createSut(status: true)
//        sut.loadData()
//
//        XCTAssertEqual(viewControllerSpy.showArgs.count, 2)
//    }
//
//    func test_loadData_whenStatusIsTrue_shouldCallViewControllerFunctionShowWithCorrectValues() {
//        createSut(status: true)
//        sut.loadData()
//
//        let expectedValue: [ViewState] = [.loading, .ready("Tudo certo por aqui")]
//
//        XCTAssertEqual(viewControllerSpy.showArgs, expectedValue)
//    }
//
//    func test_tryAgain_shouldRepeateLoadDataFlowCorrectly() {
//        sut.tryAgain(status: false)
//
//        let expectedValue: [ViewState] = [.loading, .error]
//
//        XCTAssertEqual(viewControllerSpy.showArgs.count, 2)
//        XCTAssertEqual(viewControllerSpy.showArgs, expectedValue)
//    }
//
//    func createSut(status: Bool = false) {
//        sut = Presenter(delayTime: 0,
//                        status: status,
//                        queue: dispatchQueueMock)
//        sut.viewController = viewControllerSpy
//    }
//}
