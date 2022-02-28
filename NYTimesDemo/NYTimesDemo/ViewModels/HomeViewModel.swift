//
//  HomeViewModel.swift
//  NYTimesDemo
//
//  Created by Gajula Ravi Kiran on 27/02/2022.
//

import UIKit

class HomeViewModel: NSObject {

    var dataFetcherModel: JsonLoader?

    override init() {
        super.init()
        dataFetcherModel = JsonLoader()
    }
}

extension HomeViewModel {

    func numberOfSections() -> Int {
        return dataFetcherModel?.resObject?.count ?? 0
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        return dataFetcherModel?.resObject?[section].items?.count ?? 0
    }
    
    func sectionTitle(section: Int) -> String {
        return dataFetcherModel?.resObject?[section].sectionTitle ?? ""
    }
    
    func rowTitleForIndex(indexPath: IndexPath) -> String {
        return dataFetcherModel?.resObject?[indexPath.section].items?[indexPath.row] ?? ""
    }
    
    func getArticleType(title: String) -> ArticleType {
        switch title {
        case "Most Viewed":
            return .MOSTVIEWED
        case "Most Shared":
            return .MOSTSHARED
        case "Most Emailed":
            return .MOSTEMAILED
        default:
            return .SEARCHRESULT
        }
    }
    
}

//MARK: Api calls
extension HomeViewModel {
    
    func getArticleResults(for selectedType: ArticleType, completion: @escaping(_ articles: [Results]?, _ error: Error?) -> ()) {
        var url = ""
        switch selectedType {
        case .MOSTVIEWED:
            url = MOST_POPULAR_BASE_SCHEMA + MOST_VIEWED_END_POINT + API_KEY
        case .MOSTSHARED:
            url = MOST_POPULAR_BASE_SCHEMA + MOST_SHARED_END_POINT + API_KEY
        case .MOSTEMAILED:
            url = MOST_POPULAR_BASE_SCHEMA + MOST_EMAILED_END_POINT + API_KEY
        default:
            url = MOST_POPULAR_BASE_SCHEMA + MOST_VIEWED_END_POINT + API_KEY
        }
        NetworkClass.getRequest(with: url, decodingType: MostPopularModel.self) { [weak self] res, errorObj in
            guard let self = self else { return }
            if let responseObj = res as? MostPopularModel {
                print("responsObj == \(responseObj)")
                completion(responseObj.results, nil)
            } else if let error = errorObj {
                completion(nil, error)
            }
        }
    }
}
