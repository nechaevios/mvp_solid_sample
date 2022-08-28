import UIKit

protocol Builder {
    static func createMainModule() -> UIViewController
}

final class ModuleBuilder: Builder {
    
    static func createMainModule() -> UIViewController {
        let networkService = NetworkService()
        let viewController = MainViewController()
        let presenter = MainViewPresenter(view: viewController, networkService: networkService)
        viewController.presenter = presenter
        
        return viewController
    }
}
