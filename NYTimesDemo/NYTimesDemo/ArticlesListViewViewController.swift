//
//  ArticlesListViewViewController.swift
//  NYTimesDemo
//
//  Created by Gajula Ravi Kiran on 27/02/2022.
//

import UIKit

class ArticlesListViewViewController: BaseViewController {
    
    @IBOutlet weak var listTableView: UITableView!
    var viewModel: ArticlesListViewModel?
    var typeOfArticle: ArticleType?
    
    static func instantiate() -> ArticlesListViewViewController {
      let vc = instantiate(viewControllerIdentifier: "ArticlesListViewViewController") as! ArticlesListViewViewController
      return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Articles"
        initArticleListTableView()
        viewModel = ArticlesListViewModel(type: typeOfArticle)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel?.reloadTableView = { [weak self] in
            self?.reloadTableView()
        }
    }
}

extension ArticlesListViewViewController {
    private func reloadTableView() {
        DispatchQueue.main.async {
            self.listTableView.reloadData()
        }
    }
}

//MARK: Register TableView Cells
extension ArticlesListViewViewController {
    private func registerHomeTableViewCell() {
        listTableView.register(UINib(nibName: ArticlesDetailsTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ArticlesDetailsTableViewCell.identifier)
    }
    
    private func initArticleListTableView() {
        registerHomeTableViewCell()
        listTableView.dataSource = self
        listTableView.delegate = self
        listTableView.rowHeight = UITableView.automaticDimension
    }
}

extension ArticlesListViewViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.getRowCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticlesDetailsTableViewCell.identifier, for: indexPath) as? ArticlesDetailsTableViewCell else { return UITableViewCell() }
        if let item = viewModel?.getItem(for: indexPath.row) {
            cell.configureCell(item: item)
        }
        return cell
    }
    
    
}
