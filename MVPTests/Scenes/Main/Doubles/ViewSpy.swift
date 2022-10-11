import Foundation
import UIKit

@testable import MVP

class ViewSpy: UIView, ViewType {

    var didTapTryAgainButton: (() -> Void)?
    
    private(set) var showArgs = [ViewState]()
    func show(state: ViewState) {
        showArgs.append(state)
    }
}
