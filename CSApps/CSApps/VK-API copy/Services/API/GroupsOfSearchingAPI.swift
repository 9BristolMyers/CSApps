//
//  GroupsOfSearchingAPI.swift
//  CSApp
//
//  Created by Владимир Рузавин on 11/12/21.
//

import Foundation
import Alamofire

struct GroupsOfSearching {
    
}

final class GroupsOfSearchingAPI {
    
    let baseUrl = "https://api.vk.com/method"
    let token = Session.shared.token
    let userId = Session.shared.userId
    let version = "5.81"
    
    func getGroupsOfSearching(completion: @escaping([GroupsOfSearching])->()) {
        
        let method = "/groupsofserching.get"
        
        let parameters: Parameters = [
            "user_id": userId,
            "order": "name",
            "access_token": token,
            "fields": "photo_50, photo_100",
            "count": 10,
            "v": version
        ]
        
        let url = baseUrl + method
        
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            
            print(response.value)
        }
    }
}
