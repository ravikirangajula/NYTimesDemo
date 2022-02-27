//
//  ViewController.swift
//  NYTimesDemo
//
//  Created by Gajula Ravi Kiran on 27/02/2022.
//

import UIKit

class ViewController: BaseViewController {
    @IBOutlet weak var homeTableView: UITableView!
    var viewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        initHomeTableView()
        self.title = "New York Times"
    }

}

//MARK: Register TableView Cells
extension ViewController {
    private func registerHomeTableViewCell() {
        homeTableView.register(UINib(nibName: HomeTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: HomeTableViewCell.identifier)
    }
    
    private func initHomeTableView() {
        registerHomeTableViewCell()
        homeTableView.dataSource = self
        homeTableView.delegate = self
    }
}

extension ViewController {
    
    func navigateToDetails(with itemType: String) {
        if viewModel.getArticleType(title: itemType) == .SEARCHRESULT {
            let vc = ArticlesSearchViewController.instantiate()
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            let vc = ArticlesListViewViewController.instantiate()
            vc.typeOfArticle = viewModel.getArticleType(title: itemType)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
