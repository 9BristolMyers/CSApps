//
//  PhotosAPI.swift
//  CSApp
//
//  Created by Владимир Рузавин on 11/12/21.
//

import Foundation
import Alamofire

struct Photos {
    
}

final class PhotosAPI {
    
    let baseUrl = "https://api.vk.com/method"
    let token = Session.shared.token
    let userId = Session.shared.userId
    let version = "5.81"
    
    func getPhotos(completion: @escaping([Friend])->()) {
        
        let method = "/photos.get"
        
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
