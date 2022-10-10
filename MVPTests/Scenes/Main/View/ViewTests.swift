import XCTest

@testable import MVP

final class ViewTests: XCTestCase {
    
    var sut: View!
    
    override func setUp() {
        sut = View()
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func test_show_whenLoadingState_shouldShowLoadingView() {
        let loadingView = getSubView(by: "buttonTryAgain")
        
        let capturedValue = loadingView?.isHidden
        let expectedValue: Bool? = false
        
        sut.show(state: .loading)
        XCTAssertEqual(capturedValue, expectedValue)
    }

    func test_show_whenErrorState_shouldShowErrorView() {
        let errorButton = getSubView(by: "buttonTryAgain")
        
        let capturedValue = errorButton?.isHidden
        let expectedValue: Bool? = false
        
        sut.show(state: .error)
        XCTAssertEqual(capturedValue, expectedValue)
    }
    
    func getSubView(by identifier: String) -> UIView? {

        for subView in sut.subviews {
            if subView.accessibilityIdentifier == identifier {
                return subView
            }
        }

        return nil
    }
}


