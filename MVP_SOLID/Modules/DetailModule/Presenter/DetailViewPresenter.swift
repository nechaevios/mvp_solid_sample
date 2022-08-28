import Foundation

/// View Interface
protocol DetailViewProtocol: AnyObject {
    func setComment(comment: Comment?)
}

protocol DetailViewPresenterProtocol: AnyObject {
    init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, comment: Comment?)
    func setComment()
}

final class DetailViewPresenter: DetailViewPresenterProtocol {
    
    weak var view: DetailViewProtocol?
    let networkService: NetworkServiceProtocol!
    let comment: Comment?
    
    init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, comment: Comment?) {
        self.view = view
        self.networkService = networkService
        self.comment = comment
    }
    
    func setComment() {
        self.view?.setComment(comment: comment)
    }
    
    
}
