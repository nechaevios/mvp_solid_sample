import UIKit

protocol Builder {
    static func createMainModule() -> UIViewController
    static func createDetailModule(comment: Comment?) -> UIViewController
}

final class ModuleBuilder: Builder {
    
    static func createMainModule() -> UIViewController {
        let networkService = NetworkService()
        let viewController = MainViewController()
        let presenter = MainViewPresenter(view: viewController, networkService: networkService)
        viewController.presenter = presenter
        
        return viewController
    }
    
    static func createDetailModule(comment: Comment?) -> UIViewController {
        let networkService = NetworkService()
        let viewController = DetailViewController()
        let presenter = DetailViewPresenter(view: viewController, networkService: networkService, comment: comment)
        viewController.presenter = presenter
        
        return viewController
    }
    
}
