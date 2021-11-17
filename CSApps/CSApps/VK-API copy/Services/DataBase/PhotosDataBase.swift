//
//  PhotosDataBase.swift
//  CSApp
//
//  Created by Владимир Рузавин on 11/13/21.
//

import Foundation
import RealmSwift

class PhotoModel: Object {
    @objc dynamic var name = ""
    @objc dynamic var compatibility = Bool
    @objc dynamic var size = Int
}

protocol PhotoDataBaseProtocol {
    
    func create(_ photo: PhotoModel)
    func read() -> [PhotoModel]
    func delete(_ photo: PhotoModel)
}

final class PhotoDataBase: PhotoDataBaseProtocol {
    
    init() {
        
        Realm.Configuration.defaultConfiguration = Realm.Configuration(schemasVersion: 7)
    }

    func save(_ items: [PhotoModel]) {
        let realm = try! Realm()
        
        try! realm.write {
            
            realm.add(items)
        }
    }
    
    func load() -> Results<PhotoModel> {
        
        let realm = try! Realm()
        
        let photos: Results<PhotoModel>
        
        return photos
    }
    
    func delete(_ item: PhotoModel) {
        
        let realm = try! Realm()
        
        try! realm.write {
            realm.delete(item)
        }
    }
}
