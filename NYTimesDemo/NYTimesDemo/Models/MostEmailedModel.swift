//
//  MostEmailedModel.swift
//  NYTimesDemo
//
//  Created by Gajula Ravi Kiran on 27/02/2022.
//

import Foundation

struct MostEmailedModel: Codable {
    var status: String?
    var copyright: String?
    var resultsCount: Int?
    var results: [results]?
    
    enum CodingKeys:String, CodingKey {
       case status
       case copyright
       case resultsCount = "num_results"
       case results
    }
}


struct results: Codable {
    var id: Int?
    var published_date: String?
    var updated: String?
    var title: String?
    var abstract: String?
    
    enum CodingKeys:String, CodingKey {
       case id
       case published_date
       case updated
       case title
       case abstract
    }
}
