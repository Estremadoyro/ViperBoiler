//
//  SearchRouter.swift
//  AnimeCalendar
//
//  Created by leonardo on 10/09/23 using ViperBoiler
//

protocol SearchRoutable {
    func start(presenter: SearchPresentable) -> SearchScreen
}

final class SearchRouter {
    // MARK: - Public State
    
    // MARK: - Private State
    
    // MARK: - UI
    
    // MARK: - Initializers
    init() {}
    
    // MARK: - API
}

// MARK: - Detail
extension SearchRouter: SearchRoutable {
    func start(presenter: SearchPresentable) -> SearchScreen {
        return SearchScreen(presenter: presenter)
    }
}
