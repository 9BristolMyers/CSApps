//
//  Session.swift
//  CSApp
//
//  Created by Владимир Рузавин on 11/12/21.
//

import Foundation
import SwiftKeychainWrapper

final class Session {
    
    private init() {}
    
    static let shared = Session()
    
    var token: String {
        set {
            
            UserDefaults.standard.integer(newValue, forKey: "token")
        }
        get {
            
            return UserDefaults.standard.string(forKey: "token") ?? ""
        }
    var userId: Int {
        set {
            
            UserDefaults.standard.integer(newValue, forKey: "userId")
        }
        get {
            
            return UserDefaults.standard.integer(forKey: "userId")
        }
    }
}
