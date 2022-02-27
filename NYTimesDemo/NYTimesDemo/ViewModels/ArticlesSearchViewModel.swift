//
//  ArticlesSearchViewModel.swift
//  NYTimesDemo
//
//  Created by Gajula Ravi Kiran on 27/02/2022.
//

import UIKit

class ArticlesSearchViewModel: NSObject {
    var queryString:String?
    var searchResults: [Docs]?
    var reloadTableView: (() -> ())?

    override init() {
        super.init()
    }
    convenience init(queryString:String) {
        self.init()
        self.queryString = queryString
        getSearchResults()
    }
}

extension ArticlesSearchViewModel {
    func getItem(for row: Int) -> Docs? {
        return searchResults?[row]
    }
    
    func getRowCount() -> Int {
        return searchResults?.count ?? 0
    }
}

extension ArticlesSearchViewModel {
    
    private func getSearchResults() {
        //q=election&
        guard let queryStr = queryString else { return }
        let parm = "q=\(queryStr)&"
        let url = SEARCH_BASE_SCHEMA + SEARCH_END_POINT +  parm + API_KEY
        NetworkClass.getRequest(with: url, decodingType: SearchModel.self) { [weak self] res, Error in
            guard let self = self else { return }
            if let responseObj = res as? SearchModel {
                self.searchResults = responseObj.response?.docs
                print("search result == \(responseObj.response?.docs)")
                self.reloadTableView?()
            }
        }
    }

}
