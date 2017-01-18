//
//  Business.swift
//  CheckUpdate
//
//  Created by Arvind on 1/18/17.
//  Copyright © 2017 Arvind. All rights reserved.
//

import Foundation
import SwiftyJSON

class Business {
    func checkIfUpdateIsNeeded(url:String,completion: @escaping (JSON) -> ()) {
       Services().GetData(endPoint: url, parameters: nil, headers: nil, completion: completion)
    }
}

