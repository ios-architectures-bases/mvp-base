import XCTest

@testable import MVP

final class ViewTests: XCTestCase {
    
    var sut: View!

    override func setUp() {
        sut = View()
        sut.layoutSubviews()
    }
    
    override func tearDown() {
        sut = nil
    }

    func test_init_shouldBeAKinfOfViewType() {
        XCTAssertTrue(sut is ViewType)
    }

    func test_show_whenLoadingState_shouldShowLoadingView() {
        sut.show(state: .loading)

        let loadingView = sut.getSubView(by: "viewLoading")
        
        let capturedValue = loadingView?.isHidden
        let expectedValue: Bool? = false
        
        XCTAssertEqual(capturedValue, expectedValue)
    }

    func test_show_whenErrorState_shouldShowErrorView() {
        sut.show(state: .error)

        let errorButton = sut.getSubView(by: "buttonTryAgain")
        
        let capturedValue = errorButton?.isHidden
        let expectedValue: Bool? = false
        
        XCTAssertEqual(capturedValue, expectedValue)
    }

    func test_show_whenReadyState_shouldShowTitleLabelWithCorrectValue() {
        sut.show(state: .ready("teste"))
    
        let titleLabel = sut.getSubView(by: "labelTitle") as? UILabel
        
        let capturedText = titleLabel?.text
        let capturedValue = titleLabel?.isHidden
        let expectedValue: Bool? = false

        XCTAssertEqual(capturedValue, expectedValue)
        XCTAssertEqual(capturedText, "teste")
    }

    func test_didTapTryAgain_whenTapTryAgainButton() {
        
        var didTapTryAgainButtonCallCount = 0

        sut.didTapTryAgainButton = {
            didTapTryAgainButtonCallCount += 1
        }
    
        let errorButton = sut.getSubView(by: "buttonTryAgain") as? UIButton
        errorButton?.sendActions(for: .touchUpInside)

        XCTAssertEqual(didTapTryAgainButtonCallCount, 1)
    }
}


