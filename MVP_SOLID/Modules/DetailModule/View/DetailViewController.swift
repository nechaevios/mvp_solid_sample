import UIKit

class DetailViewController: UIViewController {
    
    //MARK: - @IBOutlet
    @IBOutlet weak var commentLabel: UILabel!
    
    var presenter: DetailViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setComment()
    }

    @IBAction func tapAction(_ sender: Any) {
        presenter.tap()
    }
}

extension DetailViewController: DetailViewProtocol {
    func setComment(comment: Comment?) {
        commentLabel.text = comment?.body
    }
}
