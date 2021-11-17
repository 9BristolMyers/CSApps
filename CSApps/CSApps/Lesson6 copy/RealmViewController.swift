//
//  RealmViewController.swift
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

class RealmViewController: UIViewController {
    
    let personDataBase = PersonDataBase()
    
    var persons: [PersonDataBase] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let person = PersonModel()
        person.name = "Deleted 4"
        person.age = 14
        personDataBase.create(person) {
        
        personDataBase.read()
        
        personDataBase.delete(person)
        
        personDataBase.read()
        /* person.pet = "Vanessa"
         
        let migration = Realm.configuration(schemaVersion: 3)
        let mainRealm = try! Realm(configuration: migration)
        mainRealm.add(person)
        
        mainRealm.beginWrite()
        mainRealm.add(person)
        try! mainRealm.commitWrite()
        
        print(mainRealm.confirmation.fileURL ?? "")
        
        let persons = mainRealm.objects(PersonModel.self)
        persons.forEach { print($0.name, $0.age, $0.pet) }
        print(mainRealm.confirmation.fileURL ?? "")
        return Array(users)
        
        mainRealm.beginWrite()
        mainRealm.delete(person)
        try! mainRealm.commitWrite()
    }*/
        }
    }
}
        
        class PhotoModel: Object {
            
            @objc dynamic var name = ""
            @objc dynamic var compatibility = Bool
            @objc dynamic var size = Int
        }

        class RealmViewController: UIViewController {
            
            let photoDataBase = PhotoDataBase()
            
            var photos: [PhotoDataBase] = []
            
            override func viewDidLoad() {
                super.viewDidLoad()

                let photo = PhotoModel()
                photo.name = "Deleted 4"
                photo.compatibility = true
                photoDataBase.create(photo) {
                
                photoDataBase.read()
                
                photoDataBase.delete(photo)
                
                photoDataBase.read()
                }
            }
        }
}

class GroupModel: Object {
    
    @objc dynamic var name = ""
    @objc dynamic var size = Int
}

class RealmViewController: UIViewController {
    
    let groupDataBase = GroupDataBase()
    
    var groups: [GroupDataBase] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let group = GroupModel()
        group.name = "Deleted 4"
        groupDataBase.create(group) {
        
        groupDataBase.read()
        
            groupDataBase.delete(group)
        
            groupDataBase.read()
        }
    }
}
