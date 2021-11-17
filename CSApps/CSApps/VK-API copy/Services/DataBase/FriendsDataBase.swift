//
//  FriendsDataBase.swift
//  CSApp
//
//  Created by Владимир Рузавин on 11/12/21.
//

import Foundation
import RealmSwift

class PersonModel: Object {
    @objc dynamic var name = ""
    @objc dynamic var age = 0
    @objc dynamic var weapon = ""
    var car = ""//сохраняться не будет
}

protocol PersonDataBaseProtocol {
    
    func create(_ person: PersonModel)
    func read() -> [PersonModel]
    func delete(_ person: PersonModel)
}

final class FriendsDataBase: PersonDataBaseProtocol {
    
    init() {
        
        Realm.Configuration.defaultConfiguration = Realm.Configuration(schemasVersion: 7)
    }

    func save(_ items: [FriendModel]) {
        let realm = try! Realm()
        
        try! realm.write {
            
            realm.add(items)
        }
    }
    
    func load() -> Results<FriendModel> {
        
        let realm = try! Realm()
        
        let friends: Results<FriendModel>
        
        return friends
    }
    
    func delete(_ item: FriendModel) {
        
        let realm = try! Realm()
        
        try! realm.write {
            realm.delete(item)
        }
    }
}
