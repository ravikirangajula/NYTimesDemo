//
//  HomeViewModel.swift
//  NYTimesDemo
//
//  Created by Gajula Ravi Kiran on 27/02/2022.
//

import UIKit

class HomeViewModel: NSObject {
    
    var tableViewDataSource: [String: [String]] = ["Search":["Search Articles"], "Popular":["Most Viewed", "Most Shared", "Most Emailed"]]
    
    override init() {
        super.init()
    }

}

extension HomeViewModel {

    func numberOfSections() -> Int {
        return tableViewDataSource.count
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        return Array(tableViewDataSource)[section].value.count
    }
    
    func sectionTitle(section: Int) -> String {
        return Array(tableViewDataSource.keys)[section]
    }
    
    func rowTitleForIndex(indexPath: IndexPath) -> String {
        return Array(tableViewDataSource.values)[indexPath.section][indexPath.row]
    }
}
