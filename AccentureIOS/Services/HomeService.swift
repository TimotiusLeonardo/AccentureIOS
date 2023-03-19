//
//  HomeService.swift
//  AccentureIOS
//
//  Created by Timotius Leonardo Lianoto on 19/03/23.
//

import Foundation

protocol HomeServiceProtocol {
    func getPostData(completion: @escaping (_ results: [HomeModel]?, _ error: String?) -> ())
}

class HomeService: HomeServiceProtocol {
    func getPostData(completion: @escaping ([HomeModel]?, String?) -> ()) {
        HttpRequestHelper().GET(url: "https://jsonplaceholder.typicode.com/posts", params: ["": ""]) { success, data in
            if success {
                do {
                    let model = try JSONDecoder().decode([HomeModel].self, from: data!)
                    DispatchQueue.main.async {
                        completion(model, nil)
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion(nil, "Error: Trying to parse [HomeModel] to model")
                    }
                }
            } else {
                DispatchQueue.main.async {
                    completion(nil, "Error: HomeGetPost GET Request failed")
                }
            }
        }
    }
}
