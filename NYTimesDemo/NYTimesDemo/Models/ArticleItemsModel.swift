//
//  ArticleItemsModel.swift
//  NYTimesDemo
//
//  Created by Gajula Ravi Kiran on 27/02/2022.
//

import Foundation

struct ArticleItemsModel: Codable {
    var sectionTitle: String?
    var items: [String]?
    
    enum CodingKeys:String,CodingKey {
        case sectionTitle
        case items
    }
}
