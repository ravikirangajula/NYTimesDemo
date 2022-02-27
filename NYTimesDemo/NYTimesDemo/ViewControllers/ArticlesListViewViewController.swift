//
//  ArticlesListViewViewController.swift
//  NYTimesDemo
//
//  Created by Gajula Ravi Kiran on 27/02/2022.
//

import UIKit

class ArticlesListViewViewController: BaseViewController {
    
    @IBOutlet weak var listTableView: UITableView!
    var mostPopularDataSource: MostPopularDataSource?
    var searchDataSource: SearchArticleDataSource?
    var typeOfArticle: ArticleType?
    var queryString: String?
    lazy var viewModel: ArticlesListViewModel = { [weak self] in
        return  ArticlesListViewModel(type: typeOfArticle, queryString: queryString ?? "")
    }()
    lazy var searchViewModel: ArticlesSearchViewModel = { [weak self] in
        return ArticlesSearchViewModel(queryString: queryString ?? "")
    }()

    static func instantiate() -> ArticlesListViewViewController {
      let vc = instantiate(viewControllerIdentifier: "ArticlesListViewViewController") as! ArticlesListViewViewController
      return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Articles"
        if typeOfArticle == .SEARCHRESULT {
            self.searchDataSource = SearchArticleDataSource(articlesList: searchViewModel)
        } else {
            viewModel = ArticlesListViewModel(type: typeOfArticle, queryString: queryString ?? "")
            self.mostPopularDataSource = MostPopularDataSource(articlesList: self.viewModel)
        }
        initArticleListTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        searchViewModel.reloadTableView = { [unowned self] in
            self.reloadTableView()
        }
        
        viewModel.reloadTableView = { [unowned self] in
            self.reloadTableView()
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
        switch typeOfArticle {
        case .SEARCHRESULT:
            listTableView.dataSource = searchDataSource
            listTableView.delegate = searchDataSource
        default:
            listTableView.dataSource = mostPopularDataSource
            listTableView.delegate = mostPopularDataSource
        }
        listTableView.rowHeight = UITableView.automaticDimension
    }
}
