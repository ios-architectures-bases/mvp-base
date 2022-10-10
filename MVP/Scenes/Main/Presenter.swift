import Foundation

class Presenter {
    
    weak var viewController: ViewControllerType?

    private func handle(status: Bool) {
        if status {
            viewController?.show(state: .ready("Tudo certo por aqui"))
            return
        }

        viewController?.show(state: .error)
    }
}

extension Presenter: PresenterType {
    func loadData() {
        
        viewController?.show(state: .loading)

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            let statusValue = Bool.random()
            self?.handle(status: statusValue)
        }
    }
}
