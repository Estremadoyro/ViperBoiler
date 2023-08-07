import UIKit

final class CastNavigationBar {
    weak var screen: UIViewController?

    init(_ screen: UIViewController) {
        self.screen = screen
	configureTitle(with: "CastNavigationBar")
    }

    func configureTitle(with title: String) {
        let titleAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.black
        ]
        
        screen?.navigationItem.title = title
        screen?.navigationController?.navigationBar.titleTextAttributes = titleAttributes
    }
}
