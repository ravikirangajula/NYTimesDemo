//
//  Constants.swift
//  NYTimesDemo
//
//  Created by Gajula Ravi Kiran on 27/02/2022.
//

import Foundation

let MOST_POPULAR_BASE_SCHEMA                      = "https://api.nytimes.com/svc/mostpopular/v2"
let API_KEY                       = "api-key=eABsOZ6uRDz83GdvPj1VzGKQAOgbRTxJ"
let NUMBER_OF_DAYS                = "7"
let MOST_EMAILED_END_POINT        = "/emailed/\(NUMBER_OF_DAYS).json?"
let MOST_SHARED_END_POINT         = "/shared/\(NUMBER_OF_DAYS)/facebook.json?"
let MOST_VIEWED_END_POINT         = "/viewed/\(NUMBER_OF_DAYS).json?"
let SEARCH_END_POINT              = "/articlesearch.json?"
let SEARCH_BASE_SCHEMA               = "https://api.nytimes.com/svc/search/v2"
