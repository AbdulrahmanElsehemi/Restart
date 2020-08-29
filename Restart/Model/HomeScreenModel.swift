//
//  HomeScreenModel.swift
//  Restart
//
//  Created by Abdelrahman on 8/27/20.
//  Copyright © 2020 abdelrahman. All rights reserved.
//

import Foundation
import SwiftyJSON
class HomeScreenModel {
    var message :String?
    
    
    init(json:JSON) {
        message = json["message"].stringValue
    }
}
