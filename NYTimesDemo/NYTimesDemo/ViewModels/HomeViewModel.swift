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
