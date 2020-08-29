//
//  iconsTextField.swift
//  Restart
//
//  Created by Abdelrahman on 8/29/20.
//  Copyright © 2020 abdelrahman. All rights reserved.
//

import Foundation
import UIKit
extension UITextField {
    
    enum Direction {
        case Left
        case Right
    }
    
    // add image to textfield
    func withImage(direction: Direction, image: UIImage, colorSeparator: UIColor, colorBorder: UIColor){
        let mainView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 35))
        mainView.layer.cornerRadius = 5
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 35))
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 5
    //    view.layer.borderWidth = CGFloat(0.5)
        view.layer.borderColor = colorBorder.cgColor
        mainView.addSubview(view)
        
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 12.0, y: 6.5, width: 16.0, height: 20.0)
        view.addSubview(imageView)
        
        let seperatorView = UIView()
        seperatorView.backgroundColor = colorSeparator
        mainView.addSubview(seperatorView)
        
        if(Direction.Left == direction){ // image left
            seperatorView.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
            self.leftViewMode = .always
            self.leftView = mainView
        } else { // image right
            seperatorView.frame = CGRect(x: 0, y: 8, width: 0.5, height: 17.5)
            self.rightViewMode = .always
            self.rightView = mainView
        }
        self.layer.borderColor = colorBorder.cgColor
        self.layer.borderWidth = CGFloat(0.5)
        self.layer.cornerRadius = 5
    }
    
}
