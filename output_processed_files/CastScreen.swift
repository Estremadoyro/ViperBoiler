import UIKit

final class CastScreen: UIViewController {
    // MARK: - Public State
    // MARK: - Private State
    private let presenter: CastPresentable
    
    // MARK: - UI
    private lazy var sampleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.text = "\(String(describing: Self.self)) OwO"
        label.font = .boldSystemFont(ofSize: 14)
        label.textAlignment = .center
        
        view.addSubview(label)
        return label
    }()
    
    // MARK: - Initializers
    init(presenter: CastPresentable) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - API
}

// MARK: - LifeCycle
extension CastScreen {
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutUI()
    }
}

// MARK: - Layout
private extension CastScreen {
    func layoutUI() {
        view.backgroundColor = .black
        layoutLabel()
    }
    
    func layoutLabel() {
        NSLayoutConstraint.activate([
            sampleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sampleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
