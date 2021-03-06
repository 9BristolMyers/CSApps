//
//  FriendModel.swift
//  CSApp
//
//  Created by Владимир Рузавин on 11/12/21.
//

import Foundation
import SwiftyJSON
import RealmSwift

class FriendModel: Object, Codable {
    @objc dynamic var id: Int
    @objc dynamic var lastName: String
    @objc dynamic var trackCode, firstName: String
    @objc dynamic var photo100: String
    
    var fullName: String {
        firstName + lastName
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case lastName = "last_name"
        case firstName = "first_name"
        case photo100 = "photo_100"
    }
}
