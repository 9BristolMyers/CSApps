//
//  GroupsDataBase.swift
//  CSApp
//
//  Created by Владимир Рузавин on 11/13/21.
//

import Foundation
import RealmSwift

class GroupModel: Object {
    @objc dynamic var name = ""
    @objc dynamic var size = Int
}

protocol GroupDataBaseProtocol {
    
    func create(_ group: GroupModel)
    func read() -> [GroupoModel]
    func delete(_ group: GroupModel)
}

final class GroupDataBase: GroupDataBaseProtocol {
    
    init() {
        
        Realm.Configuration.defaultConfiguration = Realm.Configuration(schemasVersion: 7)
    }

    func save(_ items: [GroupModel]) {
        let realm = try! Realm()
        
        try! realm.write {
            
            realm.add(items)
        }
    }
    
    func load() -> Results<GroupModel> {
        
        let realm = try! Realm()
        
        let groups: Results<GroupModel>
        
        return groups
    }
    
    func delete(_ item: GroupModel) {
        
        let realm = try! Realm()
        
        try! realm.write {
            realm.delete(item)
        }
    }
}
