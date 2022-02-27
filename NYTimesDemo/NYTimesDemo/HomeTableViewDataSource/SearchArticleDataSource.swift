//
//  SearchArticleDataSource.swift
//  NYTimesDemo
//
//  Created by Gajula Ravi Kiran on 27/02/2022.
//

import UIKit

class SearchArticleDataSource: NSObject {
    var viewModel: ArticlesSearchViewModel?
    
    convenience init(articlesList: ArticlesSearchViewModel?) {
        self.init()
        self.viewModel = articlesList
    }
}

extension SearchArticleDataSource: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.getRowCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticlesDetailsTableViewCell.identifier, for: indexPath) as? ArticlesDetailsTableViewCell else { return UITableViewCell() }
        if let item = viewModel?.getItem(for: indexPath.row) {
            cell.configureSearchCell(item: item)
        }
        return cell
    }
    
}
