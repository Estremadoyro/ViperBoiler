final class CastModule {
    // MARK: - Public State
    
    // MARK: - Private State
    private let presenter: CastPresentable
    
    // MARK: - UI
    
    // MARK: - Initializers
    init() {
        let router = CastRouter()
        let interactor = CastInteractor()
        presenter = CastPresenter(interactor: interactor, router: router)
    }
   
    // MARK: - API
    func start() -> CastScreen {
        let controller = presenter.start()
        presenter.view = controller
        
        return controller
    }
}

// MARK: - Detail
private extension CastModule {}
