//
//  Friend1.swift
//  CSApp
//
//  Created by Владимир Рузавин on 11/12/21.
//

import Foundation
import SwiftyJSON
import RealmSwift

class Friend1: Object, Codable {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var firstName: String?
    @objc dynamic var lastName: String?
    @objc dynamic var photo100: String?
    
    var fullName: String {
        (firstName ?? "") + (lastName ?? "")
    }
    
    init(item: [String: Any]) {
        self.id = item["id"] as! Int
        self.firstName = item["first_name"] as? String
        self.lastName = item["last_name"] as? String
        self.photo100 = item["photo_100"] as? String
    }
}
