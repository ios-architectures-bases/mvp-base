import Foundation

class Presenter {

    weak var viewController: ViewControllerType?

    private let delayTime: Double
    private var status: Bool
    private let queue: DispatchQueueType

    init(delayTime: Double = 2,
         status: Bool = Bool.random(),
         queue: DispatchQueueType = DispatchQueue.main) {
        self.delayTime = delayTime
        self.status = status
        self.queue = queue
    }

    private func handle() {
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

        queue.async(deadline: .now() + delayTime) { [weak self] in
            self?.handle()
        }
    }

    func tryAgain(status: Bool = Bool.random()) {
        self.status = status

        loadData()
    }
}
