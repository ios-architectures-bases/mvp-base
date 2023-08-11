import Foundation

@testable import MVP

class ViewControllerSpy: ViewControllerType {

    private(set) var showArgs = [ViewState]()
    func show(state: ViewState) {
        showArgs.append(state)
    }
}
