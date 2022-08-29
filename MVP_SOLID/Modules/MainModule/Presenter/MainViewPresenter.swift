import Foundation

/// Output protocol
protocol MainViewProtocol: AnyObject {
    func success()
    func failure(error: Error)
}

/// Input protocol
protocol MainViewPresenterProtocol: AnyObject {
    var comments: [Comment]? { get set }
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol)
    func getComments()
    func tapOnTheComment(comment: Comment?)
}

final class MainViewPresenter: MainViewPresenterProtocol {
    
    var comments: [Comment]?
    var router: RouterProtocol?
    weak var view: MainViewProtocol?
    let networkService: NetworkServiceProtocol!
    
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.router = router
        getComments()
    }
    
    func getComments() {
        networkService.getComments { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let comments):
                    self.comments = comments
                    self.view?.success()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
    
    func tapOnTheComment(comment: Comment?) {
        router?.showDetail(comment: comment)
    }
    
}
