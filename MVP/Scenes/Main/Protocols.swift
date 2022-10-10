import Foundation
import UIKit

protocol PresenterType {
    var viewController: ViewControllerType? { get set }

    func loadData()
}

protocol ViewControllerType: AnyObject {
    func show(state: ViewState)
}

protocol ViewType where Self: UIView {
    var didTapButton: (() -> Void)? { get set }
    var didTapTryAgainButton: (() -> Void)? { get set }
    
    func show(state: ViewState)
}
