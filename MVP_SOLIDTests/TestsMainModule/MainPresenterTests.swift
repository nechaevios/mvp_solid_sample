import XCTest
@testable import MVP_SOLID_TDD

class MockView: MainViewProtocol {
    var testTitle: String?
    
    func setGreeting(greeting: String) {
        testTitle = greeting
    }
}

class MainPresenterTests: XCTestCase {
    
    var view: MockView!
    var person: Person!
    var presenter: MainViewPresenter!

    override func setUpWithError() throws {
        view = MockView()
        person = Person(firstName: "Bazz", lastName: "Foo")
        presenter = MainViewPresenter(view: view, person: person)
    }

    override func tearDownWithError() throws {
        view = nil
        person = nil
        presenter = nil
    }
    
    func testModuleIsNotNil() {
        XCTAssertNotNil(view, "view is nil")
        XCTAssertNotNil(person, "person is nil")
        XCTAssertNotNil(presenter, "presenter is nil")
    }
    
    func testViewSetGreeting() {
        presenter.showGreeting()
        XCTAssertEqual(view.testTitle, "Hi Bazz Foo")
    }
    
    func testPersonModel() {
        XCTAssertEqual(person.firstName, "Bazz")
        XCTAssertEqual(person.lastName, "Foo")
    }
}
