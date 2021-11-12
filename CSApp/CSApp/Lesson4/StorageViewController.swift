//
//  StorageViewController.swift
//  CSApp
//
//  Created by Владимир Рузавин on 11/12/21.
//

import Foundation
import SwiftKeyChainWrapper
import CoreData
import RealmSwift

class User: Object {
    @objc dynamic var userid: String = ""
    @objc dynamic var token: String = ""
}

class StorageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        /*useUserDefaults()
        useKeychain()*/
        
        //useCoreData()
        useRealm()
    }
    
    func useUserDefaults() {
        
        var stopForm = UserDefaults.standard.integer(forKey: "stopForm")
        var isOnboarded = UserDefaults.standard.integer(forKey: "isOnboarded")
        
        print(stopForm, isOnboarded)
        
        UserDefaults.standard.set(3, forKey: "stopForm")
        UserDefaults.standard.set(true, forKey: "isOnboarded")
    }
    
    func useKeychain() {
       
        var token: String? = KeychainWrapper.standard.string(forKey: "token")
        
        print(token as Any)
        
        KeychainWrapper.standard.set("someToken", forKey: "token")
    }
    
    func useCoreData() {
       
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let newHuman = Human(context: context)
        newHuman.name = "Jack"
        newHuman.gender = true
        newHuman.birthday = Date() as NSDate
        
        appDelegate.saveContext()
        
        let results = try! context.fetch(Human.fetchRequest()) as! [Human]
        
        let human = results.first!
        
        print(human)
    }
    
    func useRealm() {
        
        let user = User()
        user.name = "Bitch"
        user.token = "someUser.token"
        user.userid = "someUserid"
        
        let migration = Realm.configuration(schemaVersion: 2)
        let realm = try! Realm(configuration: migration)
        
        realm.beginWrite()
        realm.add(user)
        try! realm.commitWrite()
        
        let users = realm.objects(User.self)
        
        users.forEach { print($0.name, $0.token, $0.userid) }
    }
}
