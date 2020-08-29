//
//  APIWrapper.swift
//  Restart
//
//  Created by Abdelrahman on 8/27/20.
//  Copyright © 2020 abdelrahman. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
class APIWrapper {
    class func requestGETURL(_ strURL: String, success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void) {
        Manager.request(strURL).responseJSON { (responseObject) -> Void in
            
            
            if responseObject.result.isSuccess {
                let resJson = JSON(responseObject.result.value!)
                success(resJson)
            }
            if responseObject.result.isFailure {
                let error : Error = responseObject.result.error!
                failure(error)
            }
        }
    }
    
    
    static var Manager: Alamofire.SessionManager = {
        
        let serverTrustPolicies: [String: ServerTrustPolicy] = [
            "qa.channelplay.in": .disableEvaluation
        ]
        
        // Create custom manager
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        let manager = Alamofire.SessionManager(
            configuration: URLSessionConfiguration.default,
            serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies)
        )
        
        return manager
    }()

}
