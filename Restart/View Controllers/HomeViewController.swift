//
//  HomeViewController.swift
//  Restart Task
//
//  Created by Abdelrahman on 8/27/20.
//  Copyright © 2020 abdelrahman. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher
class HomeViewController: UIViewController,MiddleButtonDelegate {
    
    func btnMiddleTapped(from: CustomTabBarControllerViewController) {
        print("tabbed")
    }
    

    private var selectedImages :[UIImage] = [
        UIImage(named: "download")!,
        UIImage(named: "download")!,
        UIImage(named: "download")!,
        UIImage(named: "download")!,

    ]
    
    @IBOutlet weak var hotspotsCollectionView: UICollectionView!
    @IBOutlet weak var eventsCollectionView: UICollectionView!
    @IBOutlet weak var attractionCollectionView: UICollectionView!
    
    @IBOutlet weak var searchTextField: UITextField!
    
    
     var photosArrayAttractions = [String]()
     var namesArrayAttractions = [String]()
     var arNamesArrayAttractions = [String]()
    
    private var photosArrayHotspots = [String]()
    private var namesArrayHotspots = [String]()
    private var arNamesArrayHotspots = [String]()
    
    
    private var photosArrayEvents = [String]()
    private var namesArrayEvents = [String]()
    private var arNamesArrayEvents = [String]()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let controller =  CustomTabBarControllerViewController()
        controller.delegatee = self

        fetchData()
        addTextFieldICons()

    }
    
    func addTextFieldICons(){
        
        if let myImage = UIImage(named: "location_search_icon"){
            searchTextField.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.gray, colorBorder: UIColor.black)
        }
        
        if let myImage = UIImage(named: "filter_inside_search"){
            searchTextField.withImage(direction: .Right, image: myImage, colorSeparator: UIColor.gray, colorBorder: UIColor.black)
        }
        
    }
    
    
}


extension HomeViewController :UICollectionViewDelegate , UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.attractionCollectionView {
            return photosArrayAttractions.count
        } else if collectionView == eventsCollectionView {
            return selectedImages.count
        } else {
            return photosArrayHotspots.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == attractionCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardviewCollectionViewCell", for: indexPath) as! CardviewCollectionViewCell
            let url = URL(string: photosArrayAttractions[indexPath.row])
            cell.cardImage.kf.setImage(
                with: url,
                placeholder: UIImage(named: "download"),
                options: [
                    .cacheOriginalImage
            ])
              cell.nameItem.text = namesArrayAttractions[indexPath.row]
              cell.descItem.text = arNamesArrayAttractions[indexPath.row]

            return cell
        } else if collectionView == eventsCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardviewCollectionViewCell", for: indexPath) as!CardviewCollectionViewCell
            cell.cardImage.image = selectedImages[indexPath.row]
            
//            cell.nameItem.text = namesArrayEvents[indexPath.row]
        //    cell.descItem.text = arNamesArrayEvents[indexPath.row]


            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardviewCollectionViewCell", for: indexPath) as!CardviewCollectionViewCell
            
            let url = URL(string: photosArrayHotspots[indexPath.row])
            cell.cardImage.kf.setImage(
                with: url,
                placeholder: UIImage(named: "download"),
                options: [
                    .cacheOriginalImage
            ])
            cell.nameItem.text = namesArrayHotspots[indexPath.row]
            cell.descItem.text = arNamesArrayHotspots[indexPath.row]
            return cell
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 250)

    }
    
    
}
extension HomeViewController {

    func fetchData () {
        Alamofire.request(Constant.ApiPath.baseUrl, method: .get, encoding: JSONEncoding.default)
            .responseJSON { response in
                
                let resultJSON : JSON = JSON(response.result.value!)
                let status = resultJSON["status_code"]
                if status == 200 {
                    
                    //hotspots
                    for counter in 0 ... resultJSON["data"]["hot_spots"][1]["categories"].count - 1 {
                        self.namesArrayHotspots.append(resultJSON["data"]["hot_spots"][1]["categories"][counter]["name"].stringValue)
                        self.arNamesArrayHotspots.append(resultJSON["data"]["hot_spots"][1]["categories"][counter]["name"].stringValue)
                    }
                    if let fetchedImages = resultJSON["data"]["hot_spots"][2]["photos"].arrayObject as? [String]{
                        self.photosArrayHotspots = fetchedImages
                        DispatchQueue.main.async {
                            self.hotspotsCollectionView.reloadData()

                        }
                    }
                    
                    // events
                    
                    for counter in 0 ... resultJSON["data"]["events"][1]["categories"].count - 1 {
                        self.namesArrayEvents.append(resultJSON["data"]["events"][1]["categories"][counter]["name"].stringValue)
                        self.arNamesArrayEvents.append(resultJSON["data"]["events"][1]["categories"][counter]["name"].stringValue)
                    }
                    if let fetchedImages = resultJSON["data"]["events"][2]["photos"].arrayObject as? [String]{
                        self.photosArrayEvents = fetchedImages
                        DispatchQueue.main.async {
                            self.eventsCollectionView.reloadData()

                            
                        }
                    }
                    
                    for counter in 0 ... resultJSON["data"]["attractions"][1]["categories"].count - 1 {
                        self.namesArrayAttractions.append(resultJSON["data"]["attractions"][1]["categories"][counter]["name"].stringValue)
                        self.arNamesArrayAttractions.append(resultJSON["data"]["attractions"][1]["categories"][counter]["name"].stringValue)
                    }
                    
                    if let fetchedImages = resultJSON["data"]["attractions"][2]["photos"].arrayObject as? [String]{
                        self.photosArrayAttractions = fetchedImages
                        DispatchQueue.main.async {
                            self.attractionCollectionView.reloadData()
                            
                        }
                    }
                    
                }
                
        }
        
    }
    

}


