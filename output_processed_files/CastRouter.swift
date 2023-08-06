protocol CastRoutable {
    func start(presenter: CastPresentable) -> CastScreen
}

final class CastRouter {
    // MARK: - Public State
    
    // MARK: - Private State
    
    // MARK: - UI
    
    // MARK: - Initializers
    init() {}
    
    // MARK: - API
}

// MARK: - Detail
extension CastRouter: CastRoutable {
    func start(presenter: CastPresentable) -> CastScreen {
        return CastScreen(presenter: presenter)
    }
}
