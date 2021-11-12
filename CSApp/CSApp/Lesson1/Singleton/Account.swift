//
//  Account.swift
//  CSApp
//
//  Created by Владимир Рузавин on 11/12/21.
//

import Foundation

final class Account {
    
    private init() {}
    
    static let shared = Account()
    
    var name: String = ""
    var cash: Int = 0
}
