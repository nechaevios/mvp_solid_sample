//
//  DetailViewController.swift
//  MVP_SOLID_TDD
//
//  Created by Nechaev Sergey  on 28.08.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    //MARK: - @IBOutlet
    @IBOutlet weak var commentLabel: UILabel!
    
    var presenter: DetailViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setComment()
    }

}

extension DetailViewController: DetailViewProtocol {
    func setComment(comment: Comment?) {
        commentLabel.text = comment?.body
    }
}
