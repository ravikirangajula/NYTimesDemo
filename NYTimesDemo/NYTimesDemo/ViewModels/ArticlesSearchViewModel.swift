//
//  ArticlesSearchViewModel.swift
//  NYTimesDemo
//
//  Created by Gajula Ravi Kiran on 27/02/2022.
//

import UIKit

class ArticlesSearchViewModel: NSObject {

    override init() {
        super.init()
    }
}

extension ArticlesSearchViewModel {
    
    func getSearchResults(for queryString: String, completion: @escaping (_ results: [Docs]?) -> ()) {
        let parm = "q=\(queryString)&"
        let url = SEARCH_BASE_SCHEMA + SEARCH_END_POINT +  parm + API_KEY
        NetworkClass.getRequest(with: url, decodingType: SearchModel.self) { [weak self] res, Error in
            guard let self = self else { return }
            if let modelObj = res as? SearchModel, let responseDocs = modelObj.response?.docs  {
                print("search result == \(responseDocs)")
                completion(responseDocs)
            }
        }
    }
}
