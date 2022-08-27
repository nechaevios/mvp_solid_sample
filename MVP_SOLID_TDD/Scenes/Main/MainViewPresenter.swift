import Foundation

/// Output protocol
protocol MainViewProtocol: AnyObject {
    func setGreeting(greeting: String)
}

/// Input protocol
protocol MainViewPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, person: Person)
    func showGreeting()
}

final class MainViewPresenter: MainViewPresenterProtocol {
    let view: MainViewProtocol
    let person: Person
    
    init(view: MainViewProtocol, person: Person) {
        self.view = view
        self.person = person
    }
    
    /// Abstract view method setGreeting called
    func showGreeting() {
        let greeting = "Hi" + person.firstName + " " + person.lastName
        view.setGreeting(greeting: greeting)
    }
}
