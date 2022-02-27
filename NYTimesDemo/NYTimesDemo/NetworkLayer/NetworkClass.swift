//
//  NetworkClass.swift
//  NYTimesDemo
//
//  Created by Gajula Ravi Kiran on 27/02/2022.
//

import Foundation
import UIKit

enum httpMethodType:String {
    case GET = "GET"
    case POST = "POST"
    case DELETE = "DELETE"
}

class NetworkClass {
    typealias JSONParseCompletionHandler = (Decodable?, Error?) -> Void
    
    static func getRequest<T: Decodable>(with url: String, decodingType: T.Type, completionHandler completion: @escaping JSONParseCompletionHandler) -> ()  {
        guard let url = URL(string: url) else { return }
        let urlSessionObject = URLSession.shared
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData)
        let task = urlSessionObject.dataTask(with: request) { data, res, error in
            guard let resObj = data else {return}
            do {
                let genericModel = try JSONDecoder().decode(decodingType, from: resObj)
                completion(genericModel,nil)
            } catch {
                print("Error == \(error)")
                completion(nil,error)
            }
        }
        task.resume()
    }
    
}

