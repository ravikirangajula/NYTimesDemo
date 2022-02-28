//
//  ArtcilesListSearchViewModel.swift
//  NYTimesDemo
//
//  Created by Gajula Ravi Kiran on 28/02/2022.
//

import UIKit

class ArtcilesListSearchViewModel: NSObject {
   
   var searchResults: [Docs]?

    override init() {
        super.init()
    }
    
    convenience init(results:[Docs]?) {
        self.init()
        self.searchResults = results
    }
}

extension ArtcilesListSearchViewModel {
    
    func getTitle() -> String {
        return "Search Results"
    }
    
    func getItem(for row: Int) -> Docs? {
        return searchResults?[row]
    }
    
    func getRowCount() -> Int {
        return searchResults?.count ?? 0
    }
}
