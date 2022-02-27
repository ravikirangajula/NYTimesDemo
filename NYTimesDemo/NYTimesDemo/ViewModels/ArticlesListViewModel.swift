//
//  ArticlesListViewModel.swift
//  NYTimesDemo
//
//  Created by Gajula Ravi Kiran on 27/02/2022.
//

import UIKit

enum ArticleType {
    case MOSTVIEWED
    case MOSTSHARED
    case MOSTEMAILED
    case SEARCHRESULT
}
class ArticlesListViewModel: NSObject {
    
    var queryString: String?
    var mostPopularResults: [results]?
    var reloadTableView: (() -> ())?
    
    override init() {
        super.init()
    }
    
    convenience init(type:ArticleType?, queryString:String = "") {
        self.init()
        self.queryString = queryString
        switch type {
        case .MOSTVIEWED:
            getMostViewedList()
        case .MOSTSHARED:
            getMostSharedList()
        case .MOSTEMAILED:
            getMostEmailedList()
        default:
            break
        }
    }
}

extension ArticlesListViewModel {
    func getItem(for row: Int) -> results? {
        return mostPopularResults?[row]
    }
    
    func getRowCount() -> Int {
        return mostPopularResults?.count ?? 0
    }
}

//MARK: API Calls
extension ArticlesListViewModel {
    
    private func getMostEmailedList() {
        let url = MOST_POPULAR_BASE_SCHEMA + MOST_EMAILED_END_POINT + API_KEY
        NetworkClass.getRequest(with: url, decodingType: MostPopularModel.self) { [weak self] res, Error in
            guard let self = self else { return }
            if let responseObj = res as? MostPopularModel {
                self.mostPopularResults = responseObj.results
                print("responsObj == \(responseObj)")
                self.reloadTableView?()
            }
        }
    }
    
    private func getMostSharedList() {
        let url = MOST_POPULAR_BASE_SCHEMA + MOST_SHARED_END_POINT + API_KEY
        NetworkClass.getRequest(with: url, decodingType: MostPopularModel.self) { [weak self] res, Error in
            guard let self = self else { return }
            if let responseObj = res as? MostPopularModel {
                self.mostPopularResults = responseObj.results
                print("responsObj == \(responseObj)")
                self.reloadTableView?()
            }
        }
    }
    
    private func getMostViewedList() {
        let url = MOST_POPULAR_BASE_SCHEMA + MOST_VIEWED_END_POINT + API_KEY
        NetworkClass.getRequest(with: url, decodingType: MostPopularModel.self) { [weak self] res, Error in
            guard let self = self else { return }
            if let responseObj = res as? MostPopularModel {
                self.mostPopularResults = responseObj.results
                print("responsObj == \(responseObj)")
                self.reloadTableView?()
            }
        }
    }

}
