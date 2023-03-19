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
    var postDatas: [HomeModel] = [] {
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
            
            self?.postDatas = data
        }
    }
}
