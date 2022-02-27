//
//  MostPopularDataSource.swift
//  NYTimesDemo
//
//  Created by Gajula Ravi Kiran on 27/02/2022.
//

import UIKit

class MostPopularDataSource: NSObject {
    var viewModel: ArticlesListViewModel?
    
    convenience init(articlesList: ArticlesListViewModel?) {
        self.init()
        self.viewModel = articlesList
    }
}

extension MostPopularDataSource: UITableViewDataSource, UITableViewDelegate {
    
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
