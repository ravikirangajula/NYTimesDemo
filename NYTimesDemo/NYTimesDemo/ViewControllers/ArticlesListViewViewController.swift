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
    var mostPopularResults: [Results]?
    var searchResults: [Docs]?
    
    lazy var viewModel: ArticlesListViewModel = { [weak self] in
        return  ArticlesListViewModel(type: typeOfArticle, results: mostPopularResults)
    }()
    
    lazy var articlesListSearchViewModel: ArtcilesListSearchViewModel = { [weak self] in
        return ArtcilesListSearchViewModel(results: searchResults)
    }()

    static func instantiate() -> ArticlesListViewViewController {
      let vc = instantiate(viewControllerIdentifier: "ArticlesListViewViewController") as! ArticlesListViewViewController
      return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if typeOfArticle == .SEARCHRESULT {
            self.title = articlesListSearchViewModel.getTitle()
            self.searchDataSource = SearchArticleDataSource(articlesList: articlesListSearchViewModel)
        } else {
            self.title = viewModel.getTitle()
            self.mostPopularDataSource = MostPopularDataSource(articlesList: viewModel)
        }
        initArticleListTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
