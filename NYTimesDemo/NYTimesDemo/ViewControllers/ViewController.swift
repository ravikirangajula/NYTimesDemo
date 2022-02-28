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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
            let articleType = viewModel.getArticleType(title: itemType)
            viewModel.getArticleResults(for: articleType) {[unowned self] articles, error in
                if let list = articles, list.count > 0 {
                    self.showDeatilsPage(result: list, artcileType: articleType)
                }
            }
        }
    }
    
    private func showDeatilsPage(result: [Results], artcileType: ArticleType) {
        DispatchQueue.main.async {
            let vc = ArticlesListViewViewController.instantiate()
            vc.typeOfArticle = artcileType
            vc.mostPopularResults = result
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
