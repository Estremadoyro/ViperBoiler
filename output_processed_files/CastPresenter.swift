import class UIKit.UINavigationController

protocol CastPresentable: AnyObject {
    var view: CastScreen? { get set }
    func start() -> CastScreen
    func getBaseNavigation() -> UINavigationController?
}

final class CastPresenter {
    // MARK: - Public State
    weak var view: CastScreen?
    
    // MARK: - Private State
    private let interactor: CastInteractive
    private let router: CastRoutable
    
    // MARK: - Initializers
    init(interactor: CastInteractive, router: CastRoutable) {
        self.interactor = interactor
        self.router = router
    }
    
    // MARK: - API
}

// MARK: - Presentable
extension CastPresenter: CastPresentable {
    func start() -> CastScreen {
        return router.start(presenter: self)
    }
    
    func getBaseNavigation() -> UINavigationController? {
        return view?.navigationController
    }
}
