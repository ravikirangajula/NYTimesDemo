//
//  SearchModel.swift
//  NYTimesDemo
//
//  Created by Gajula Ravi Kiran on 27/02/2022.
//

import Foundation

struct SearchModel: Codable {
    var status: String?
    var copyright: String?
    var response: response?
    
    enum CodingKeys:String, CodingKey {
       case status
       case copyright
       case response
    }
}

struct response: Codable {
    var docs: [docs]?
    var meta: meta?
    
    enum CodingKeys:String, CodingKey {
       case docs
       case meta
    }
}

struct docs: Codable {
    var abstract: String?
    var webUrl: String?
    var snippet: String?
    var headline: headline?
    var pubDate: String?
    
    enum CodingKeys:String, CodingKey {
       case abstract
       case webUrl = "web_url"
       case snippet
       case headline
       case pubDate = "pub_date"
    }
}

struct headline: Codable {
    var main: String?
    var printHeadline: String?
    enum CodingKeys:String, CodingKey {
       case main
       case printHeadline = "print_headline"
    }
}

struct meta: Codable {
    var hits: Int?
    var offset: Int?
    var time: Int?
    enum CodingKeys:String, CodingKey {
       case hits
       case offset
       case time
    }
}
