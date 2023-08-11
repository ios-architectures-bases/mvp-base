import Foundation

@testable import MVP

class PresenterSpy: PresenterType {

    var viewController: MVP.ViewControllerType?
    
    private(set) var loadDataCallCount = 0
    func loadData() {
        loadDataCallCount += 1
    }
    
    private(set) var tryAgainCallcount = 0
    func tryAgain() {
        tryAgainCallcount += 1
    }
}
