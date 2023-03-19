//
//  HomeModel.swift
//  AccentureIOS
//
//  Created by Timotius Leonardo Lianoto on 19/03/23.
//

import Foundation

struct HomeModel: Codable {
    var userId: Int?
    var id: Int?
    var title: String?
    var body: String?
    
    private enum CodingKeys: String, CodingKey {
        case userId, id, title, body
    }
}
