import UIKit

class View: UIView {
    var didTapTryAgainButton: (() -> Void)?
    
    let title: UILabel = {
        let label = UILabel()
        label.text = "Default value"
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        label.accessibilityIdentifier = "labelTitle"
        return label
    }()
    
    let loadingView: UIActivityIndicatorView = {
        let loadingView = UIActivityIndicatorView(style: .medium)
        loadingView.startAnimating()
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        loadingView.accessibilityIdentifier = "viewLoading"
        return loadingView
    }()
    
    let tryAgainButton: UIButton = {
        let button = UIButton()
        button.setTitle("Tente novamente", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isHidden = true
        button.accessibilityIdentifier = "buttonTryAgain"
        return button
    }()

    override func layoutSubviews() {
        super.layoutSubviews()

        backgroundColor = .systemBackground
        configView()
        addConstraints()
        bindLayoutEvents()
    }
    
    private func configView() {
        addSubview(title)
        addSubview(loadingView)
        addSubview(tryAgainButton)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])

        NSLayoutConstraint.activate([
            loadingView.centerXAnchor.constraint(equalTo: centerXAnchor),
            loadingView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])

        NSLayoutConstraint.activate([
            tryAgainButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            tryAgainButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            tryAgainButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4),
            tryAgainButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    private func bindLayoutEvents() {
        tryAgainButton.addTarget(self,
                                 action: #selector(didTapTryAgain),
                                 for: .touchUpInside)
    }

    private func hideAllStates() {
        title.isHidden = true
        loadingView.isHidden = true
        tryAgainButton.isHidden = true
    }
    
    @objc
    private func didTapTryAgain() {
        didTapTryAgainButton?()
    }
}

extension View: ViewType {
    func show(state: ViewState) {

        hideAllStates()

        switch state {
        case .ready(let text):
            title.isHidden = false
            title.text = text
        case .error:
            tryAgainButton.isHidden = false
        case .loading:
            loadingView.isHidden = false
        }
    }
}
