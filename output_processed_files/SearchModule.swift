//
//  SearchModule.swift
//  AnimeCalendar
//
//  Created by leonardo on 10/09/23 using ViperBoiler
//

final class SearchModule {
    // MARK: - Public State
    
    // MARK: - Private State
    private let presenter: SearchPresentable
    
    // MARK: - UI
    
    // MARK: - Initializers
    init() {
        let router = SearchRouter()
        let interactor = SearchInteractor()
        presenter = SearchPresenter(interactor: interactor, router: router)
    }
   
    // MARK: - API
    func startScreenOnly() -> SearchScreen {
        let controller = presenter.start()
        presenter.view = controller
        
        return controller
    }

    func start() -> CustomNavigationController { 
        let navigation = CustomNavigationController()
    	let screen = presenter.start()

	navigation.setViewControllers([screen], animated: false)
	return navigation
    }
}

// MARK: - Detail
private extension SearchModule {}
