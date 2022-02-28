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
    
    var mostPopularResults: [Results]?
    var resultType: ArticleType?
    
    override init() {
        super.init()
    }
    
    convenience init(type:ArticleType?, results:[Results]?) {
        self.init()
        self.mostPopularResults = results
        self.resultType = type
    }
}

extension ArticlesListViewModel {
    
    func getItem(for row: Int) -> Results? {
        return mostPopularResults?[row]
    }
    
    func getRowCount() -> Int {
        return mostPopularResults?.count ?? 0
    }
    
    func getTitle() -> String {
        switch resultType {
        case .MOSTEMAILED:
            return "Most Emailed"
        case .MOSTSHARED:
            return "Most Shared"
        case .MOSTVIEWED:
            return "Most Viewed"
        default:
            return "Seacrh Results"
        }
    }
}
