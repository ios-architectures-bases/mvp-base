import UIKit

extension UIView {

    func getSubView(by identifier: String) -> UIView? {

        for subView in subviews {
            if subView.accessibilityIdentifier == identifier {
                return subView
            }
        }
        return nil
    }

}
