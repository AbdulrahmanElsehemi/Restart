//
//  BellmanAPI.swift
//  Restart
//
//  Created by Abdelrahman on 8/27/20.
//  Copyright © 2020 abdelrahman. All rights reserved.
//

import Foundation
import SVProgressHUD
class NYTimesMostViewedAPI {

    class func nyTimesMostViewedGETAPI(section:String,period:Int,viewControler:HomeViewController) {
        
        let strURL = Constant.ApiPath.baseUrl
        var  articleArray:[HomeScreenModel] = []

        APIWrapper.requestGETURL(strURL, success: {
            (JSONResponse) -> Void in
            SVProgressHUD.show()
            print(JSONResponse)
            let status = JSONResponse["status"]
            if status == 200
            {
                
                for dictJSON in JSONResponse["data"].arrayValue {
                    
                   let articleModel = HomeScreenModel(json: dictJSON )
                    
                    articleArray.append(articleModel)
                    
                }
                
                DispatchQueue.main.async {
                    
         //       viewControler.reloadTableView(articleArray:articleArray)
                }
                
            }
                
            
            
            else {
                //helper.ShowCommomAlert(title: "Error".localized, WithMessage: "ExceptionMsg".localized, showOnview: HomeViewController)
                
            }
            
            
        }) {
            (error) -> Void in
            SVProgressHUD.dismiss()
          helper.ShowCommomAlert(title: "Error", WithMessage: error.localizedDescription, showOnview: viewControler)
        }
     
    }

    
   
}
