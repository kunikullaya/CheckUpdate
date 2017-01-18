//
//  BusinessEngine.swift
//  CheckUpdate
//
//  Created by Arvind on 1/18/17.
//  Copyright © 2017 Arvind. All rights reserved.
//

import Foundation
import SwiftyJSON
import CoreData

class BusinessEngine {
    var business = Business()
}

extension BusinessEngine {
    func checkIfUpdateIsNeeded(url:String, completion: @escaping (Bool,Int?) -> ()) {
        business.checkIfUpdateIsNeeded(url: url) {
            (json) in
            guard let appID = json["results"][0]["trackId"].int else{
                completion(false,nil)
                return
            }
            
            guard let currentAppStoreVersion = json["results"][0]["version"].string else{
                completion(false,nil)
                return
            }
            
            guard let currentInstalledVersion =  Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String else{
                completion(false,nil)
                return
                
            }
            
            if (currentInstalledVersion.compare(currentAppStoreVersion, options: .numeric) == .orderedAscending) {
                completion(true,appID)
                return
            }
            completion(false,nil)
            return
        }
    }
}
