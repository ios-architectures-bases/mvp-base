import UIKit

class ViewController: UIViewController {

    private let contentView: ViewType
    private let presenter: PresenterType

    init(contentView: ViewType = View(), presenter: PresenterType) {
        self.contentView = contentView
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()

        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        bindLayoutEvents()
        presenter.loadData()
    }

    private func bindLayoutEvents() {
        contentView.didTapTryAgainButton = { [weak self] in
            self?.presenter.loadData()
        }
    }
}

extension ViewController: ViewControllerType {
    func show(state: ViewState) {
        contentView.show(state: state)
    }
}

