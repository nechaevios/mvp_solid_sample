import UIKit

final class MainViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var greetingLabel: UILabel!
    
    var presenter: MainViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func didTapButtonAction(_ sender: Any) {
        presenter.showGreeting()
    }
}

extension MainViewController: MainViewProtocol {
    func setGreeting(greeting: String) {
        greetingLabel.text = greeting
    }
}
