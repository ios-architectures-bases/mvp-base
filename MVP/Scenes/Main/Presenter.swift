import Foundation

class Presenter {

    weak var viewController: ViewControllerType?
    
    let network: NetworkType

    init(network: NetworkType = Network()) {
        self.network = network
    }

    private func handle(result: Result<String, CustomError>) {
        
        switch result {
        case .success(let text):
            viewController?.show(state: .ready(text))
        case .failure(_):
            viewController?.show(state: .error)
        }
    }
}

extension Presenter: PresenterType {
    func loadData() {

        viewController?.show(state: .loading)
        
        network.fetchStatus { [weak self] result in
            self?.handle(result: result)
        }
    }

    func tryAgain() {
        loadData()
    }
}
