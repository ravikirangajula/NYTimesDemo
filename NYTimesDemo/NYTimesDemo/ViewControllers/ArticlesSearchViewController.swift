//
//  ArticlesSearchViewController.swift
//  NYTimesDemo
//
//  Created by Gajula Ravi Kiran on 27/02/2022.
//

import UIKit

class ArticlesSearchViewController: BaseViewController {

    @IBOutlet weak var searchField: UITextField!
    var viewModel = ArticlesSearchViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Search"
    }

    static func instantiate() -> ArticlesSearchViewController {
        let vc = instantiate(viewControllerIdentifier: "ArticlesSearchViewController") as! ArticlesSearchViewController
        return vc
    }
    
    @IBAction func tapOnSearchButton(_ sender: Any) {
        dismissKeyBoard()
        if let queryString = searchField.text {
            viewModel.getSearchResults(for: queryString) { [weak self] resultsObj in
                guard let self = self else { return }
                if let results = resultsObj, results.count > 0 {
                    self.navigateToDeatails(result: results)
                }
            }
        } else {
            // show error message : enter text for search
        }
    }
    
    private func dismissKeyBoard() {
        self.searchField.resignFirstResponder()
    }
    
    private func navigateToDeatails(result: [Docs]) {
        DispatchQueue.main.async {
            let vc = ArticlesListViewViewController.instantiate()
            vc.typeOfArticle = .SEARCHRESULT
            vc.searchResults = result
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension ArticlesSearchViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        dismissKeyBoard()
        return true
    }
}
