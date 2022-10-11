import Foundation
import UIKit

protocol PresenterType {
    var viewController: ViewControllerType? { get set }

    func loadData()
    func tryAgain(status: Bool)
}

protocol ViewControllerType: AnyObject {
    func show(state: ViewState)
}

protocol ViewType where Self: UIView {
    var didTapTryAgainButton: (() -> Void)? { get set }
    
    func show(state: ViewState)
}
