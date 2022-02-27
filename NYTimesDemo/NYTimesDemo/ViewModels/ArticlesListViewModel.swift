//
//  ArticlesListViewModel.swift
//  NYTimesDemo
//
//  Created by Gajula Ravi Kiran on 27/02/2022.
//

import UIKit

class ArticlesListViewModel: NSObject {
    
    var requestId: String?
    var mostEmailedResults: [results]?
    var reloadTableView: (() -> ())?

    override init() {
        super.init()
    }
    
    convenience init(id:String) {
        self.init()
        self.requestId = id
        callMostVieedList()
    }
}

extension ArticlesListViewModel {
    func getItem(for row: Int) -> results? {
        return mostEmailedResults?[row]
    }
    
    func getRowCount() -> Int {
        return mostEmailedResults?.count ?? 0
    }
}

extension ArticlesListViewModel {
    private func callMostVieedList() {
        NetworkClass.getRequest(with: "https://api.nytimes.com/svc/mostpopular/v2/emailed/1.json?api-key=eABsOZ6uRDz83GdvPj1VzGKQAOgbRTxJ", decodingType: MostEmailedModel.self) { [weak self] res, Error in
            guard let self = self else { return }
            if let responseObj = res as? MostEmailedModel {
                self.mostEmailedResults = responseObj.results
                print("responsObj == \(responseObj)")
                self.reloadTableView?()
            }
        }

    }
}
