//
//  HomeViewModel.swift
//  AccentureIOS
//
//  Created by Timotius Leonardo Lianoto on 19/03/23.
//

import Foundation

class HomeViewModel {
    var service: HomeService = {
        let service = HomeService()
        return service
    }()
    
    var reloadDataSource: (() -> Void)
    var postDatas: [Int: [HomeModel]] = [:] {
        didSet {
            reloadDataSource()
        }
    }
    
    init(reloadDataSource: @escaping () -> Void) {
        self.reloadDataSource = reloadDataSource
    }
    
    func getData() {
        service.getPostData { [weak self] data, error in
            guard let data = data else {
                print(error ?? "Error Home Get Data")
                return
            }
            self?.restructureData(data: data)
        }
    }
    
    private func restructureData(data: [HomeModel]) {
        for _data in data {
            guard let userId = _data.userId else { continue }
            if postDatas[userId] == nil {
                postDatas[userId] = []
                postDatas[userId]?.append(_data)
                continue
            }
            // if the data exist, append it straight away
            postDatas[userId]?.append(_data)
        }
    }
}
