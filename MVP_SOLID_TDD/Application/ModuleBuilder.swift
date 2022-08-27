import UIKit

protocol Builder {
    static func createMainModule() -> UIViewController
}

final class ModuleBuilder: Builder {
    
    static func createMainModule() -> UIViewController {
        let model = Person(firstName: "Tim", lastName: "Cook")
        let viewController = MainViewController()
        let presenter = MainViewPresenter(view: viewController, person: model)
        viewController.presenter = presenter
        
        return viewController
    }
}
