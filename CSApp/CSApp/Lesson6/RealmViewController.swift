//
//  RealmViewController.swift
//  CSApp
//
//  Created by Владимир Рузавин on 11/12/21.
//

import Foundation
import RealmSwift

class RealmViewController: UIViewController {
    
    let personDataBase = PersonDataBase()
    
    var persons: [PersonDataBase] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let person = PersonModel()
        person.name = "Deleted 4"
        person.age = 14
        personDataBase.create(person)
        
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
