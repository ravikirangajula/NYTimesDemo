//
//  ArticlesSearchViewController.swift
//  NYTimesDemo
//
//  Created by Gajula Ravi Kiran on 27/02/2022.
//

import UIKit

class ArticlesSearchViewController: BaseViewController {

    @IBOutlet weak var searchField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Search"
    }

    static func instantiate() -> ArticlesSearchViewController {
        let vc = instantiate(viewControllerIdentifier: "ArticlesSearchViewController") as! ArticlesSearchViewController
        return vc
    }
    
    @IBAction func tapOnSearchButton(_ sender: Any) {
        hideKeyBoard()
        let vc = ArticlesListViewViewController.instantiate()
        vc.typeOfArticle = .SEARCHRESULT
        vc.queryString = searchField.text
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func hideKeyBoard() {
        self.searchField.resignFirstResponder()
    }
    
}

extension ArticlesSearchViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hideKeyBoard()
        return true
    }
    
    
}
