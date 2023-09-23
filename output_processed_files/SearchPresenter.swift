//
//  SearchPresenter.swift
//  AnimeCalendar
//
//  Created by leonardo on 10/09/23 using ViperBoiler
//

protocol SearchPresentable: AnyObject {
    var view: SearchScreen? { get set }
    func start() -> SearchScreen
    func getBaseNavigation() -> CustomNavigationController?
}

final class SearchPresenter {
    // MARK: - Public State
    weak var view: SearchScreen?
    
    // MARK: - Private State
    private let interactor: SearchInteractive
    private let router: SearchRoutable
    
    // MARK: - Initializers
    init(interactor: SearchInteractive, router: SearchRoutable) {
        self.interactor = interactor
        self.router = router
    }
    
    // MARK: - API
}

// MARK: - Presentable
extension SearchPresenter: SearchPresentable {
    func start() -> SearchScreen {
        return router.start(presenter: self)
    }
    
    func getBaseNavigation() -> CustomNavigationController? {
        return view?.navigationController as? CustomNavigationController
    }
}
