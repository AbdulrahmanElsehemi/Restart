//
//  HomeApi.swift
//  Restart
//
//  Created by Abdelrahman on 8/27/20.
//  Copyright © 2020 abdelrahman. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
//extension HomeViewController {
//    
//    func fetchData () {
//       //  SVProgressHUD.show()
//        Alamofire.request(Constant.ApiPath.baseUrl, method: .get, encoding: JSONEncoding.default)
//            .responseJSON { response in
//                
//                let resultJSON : JSON = JSON(response.result.value!)
//                let status = resultJSON["status_code"]
//                if status == 200 {
//                    
//                    //hotspots
//                    for counter in 0 ... resultJSON["data"]["hot_spots"][1]["categories"].count - 1 {
//                        self.namesArrayHotspots.append(resultJSON["data"]["hot_spots"][1]["categories"][counter]["name"].stringValue)
//                        self.arNamesArrayHotspots.append(resultJSON["data"]["hot_spots"][1]["categories"][counter]["name"].stringValue)
//                    }
//                    if let fetchedImages = resultJSON["data"]["hot_spots"][2]["photos"].arrayObject as? [String]{
//                        self.photosArrayHotspots = fetchedImages
//                        DispatchQueue.main.async {
//                            self.hotspotsCollectionView.reloadData()
//                            
//                        }
//                    }
//                    
//                    // events
//                    
//                    for counter in 0 ... resultJSON["data"]["events"][1]["categories"].count - 1 {
//                        self.namesArrayEvents.append(resultJSON["data"]["events"][1]["categories"][counter]["name"].stringValue)
//                        self.arNamesArrayEvents.append(resultJSON["data"]["events"][1]["categories"][counter]["name"].stringValue)
//                    }
//                    if let fetchedImages = resultJSON["data"]["events"][2]["photos"].arrayObject as? [String]{
//                        self.photosArrayEvents = fetchedImages
//                        DispatchQueue.main.async {
//                            self.eventsCollectionView.reloadData()
//                            
//                        }
//                    }
//                    
//                    for counter in 0 ... resultJSON["data"]["attractions"][1]["categories"].count - 1 {
//                        self.namesArrayAttractions.append(resultJSON["data"]["attractions"][1]["categories"][counter]["name"].stringValue)
//                        self.arNamesArrayAttractions.append(resultJSON["data"]["attractions"][1]["categories"][counter]["name"].stringValue)
//                    }
//                    
//                    if let fetchedImages = resultJSON["data"]["attractions"][2]["photos"].arrayObject as? [String]{
//                        self.photosArrayAttractions = fetchedImages
//                        DispatchQueue.main.async {
//                            self.attractionCollectionView.reloadData()
//                            
//                        }
//                    }
//                    
//                    
//                    
//                    
//                    
//                }
//                
//        }
//        
//    }
//    
//
//}
