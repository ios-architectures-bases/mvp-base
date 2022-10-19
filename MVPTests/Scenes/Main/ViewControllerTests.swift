//import XCTest
//
//@testable import MVP
//
//final class ViewControllerTests: XCTestCase {
//
//    var sut: ViewController!
//    var viewSpy: ViewSpy!
//    var presenterSpy: PresenterSpy!
//
//    override func setUp() {
//        viewSpy = ViewSpy()
//        presenterSpy = PresenterSpy()
//
//        sut = ViewController(contentView: viewSpy,
//                             presenter: presenterSpy)
//        presenterSpy.viewController = sut
//
//        sut.viewDidLoad()
//    }
//
//    override func tearDown() {
//        viewSpy = nil
//        presenterSpy = nil
//        sut = nil
//    }
//
//    func test_init_shouldBeAKinfOfViewControllerType() {
//        XCTAssertTrue(sut is ViewControllerType)
//    }
//
//    func test_loadData_viewShouldBeAKinfOfViewType() {
//        XCTAssertTrue(sut.view is ViewType)
//    }
//
//    func test_viewDidLoad_shouldCallPresenterLoadData() {
//        XCTAssertEqual(presenterSpy.loadDataCallCount, 1)
//    }
//
//    func test_viewDidLoad_shouldUseBindLayoutEvents() {
//        viewSpy.didTapTryAgainButton?()
//
//        XCTAssertEqual(presenterSpy.loadDataCallCount, 2)
//    }
//
//    func test_show_shouldCallViewFunctionShow() {
//        sut.show(state: .loading)
//
//        XCTAssertEqual(viewSpy.showArgs.count, 1)
//    }
//
//    func test_show_shouldCallViewFunctionShowWithCorectValues() {
//        sut.show(state: .loading)
//
//        XCTAssertEqual(viewSpy.showArgs, [.loading])
//    }
//}
