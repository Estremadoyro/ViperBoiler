//
//  SearchNavigationBar.swift
//  AnimeCalendar
//
//  Created by leonardo on 10/09/23 using ViperBoiler
//

import UIKit

final class SearchNavigationBar {
    weak var screen: UIViewController?

    init(_ screen: UIViewController) {
        self.screen = screen
	configureTitle(with: "SearchNavigationBar")
    }

    func configureTitle(with title: String) {
        let titleAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.black
        ]
        
        screen?.navigationItem.title = title
        screen?.navigationController?.navigationBar.titleTextAttributes = titleAttributes
    }
}
