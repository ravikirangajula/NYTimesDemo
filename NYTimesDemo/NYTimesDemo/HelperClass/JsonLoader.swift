//
//  JsonLoader.swift
//  NYTimesDemo
//
//  Created by Gajula Ravi Kiran on 27/02/2022.
//

import Foundation

class JsonLoader: NSObject {
    var resObject: [ArticleItemsModel]?
    var didFinishLoadingFromJson: (() -> ())?

    override init() {
        super.init()
        if let data = readLocalJSONFile(forName: "ArticleItems") {
            resObject = parse(jsonData: data)
        }
    }
}

//MARK: Json Loading
extension JsonLoader {
    
    private func readLocalJSONFile(forName name: String) -> Data? {
        do {
            if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
                let fileUrl = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileUrl)
                return data
            }
        } catch {
            print("error: \(error)")
        }
        return nil
    }
    
    func parse(jsonData: Data) -> [ArticleItemsModel]? {
        do {
            let decodedData = try JSONDecoder().decode([ArticleItemsModel].self, from: jsonData)
            return decodedData
        } catch {
            print("error: \(error)")
        }
        return nil
    }
}
