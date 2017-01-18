//
//  Services.swift
//  CheckUpdate
//
//  Created by Arvind on 1/18/17.
//  Copyright © 2017 Arvind. All rights reserved.
//

import Foundation

import Alamofire
import SwiftyJSON


class Services {
    
    
    // GET
    func GetData(endPoint: String, parameters: [String:AnyObject]?, headers: [String:String]?, completion: @escaping (JSON) -> ()) {
        Alamofire.request(endPoint, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                completion(json)
            case .failure(let error):
                completion(JSON(error))
            }
        }
    }
}

