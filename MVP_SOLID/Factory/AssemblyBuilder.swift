import UIKit

protocol BuilderProtocol {
    func createMainModule(router: RouterProtocol) -> UIViewController
    func createDetailModule(comment: Comment?, router: RouterProtocol) -> UIViewController
}

final class AssemblyBuilder: BuilderProtocol {
    
    func createMainModule(router: RouterProtocol) -> UIViewController {
        let networkService = NetworkService()
        let viewController = MainViewController()
        let presenter = MainViewPresenter(view: viewController, networkService: networkService, router: router)
        viewController.presenter = presenter
        
        return viewController
    }
    
    func createDetailModule(comment: Comment?, router: RouterProtocol) -> UIViewController {
        let networkService = NetworkService()
        let viewController = DetailViewController()
        let presenter = DetailViewPresenter(view: viewController, networkService: networkService, router: router, comment: comment)
        viewController.presenter = presenter
        
        return viewController
    }
    
}
