import UIKit

final class MainViewController: UIViewController {

    //MARK: - @IBOutlet
    @IBOutlet weak var greetingLabel: UILabel!
    
    var presenter: MainViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: - @IBAction
    @IBAction func didTapButtonAction(_ sender: Any) {
        presenter.showGreeting()
    }
}

extension MainViewController: MainViewProtocol {
    func setGreeting(greeting: String) {
        greetingLabel.text = greeting
    }
}
