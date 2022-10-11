import Foundation

@testable import MVP

class PresenterSpy: PresenterType {

    var viewController: MVP.ViewControllerType?
    
    private(set) var loadDataCallCount = 0
    func loadData() {
        loadDataCallCount += 1
    }
    
    private(set) var tryAgainArgs = [Bool]()
    func tryAgain(status: Bool) {
        tryAgainArgs.append(status)
    }
}
