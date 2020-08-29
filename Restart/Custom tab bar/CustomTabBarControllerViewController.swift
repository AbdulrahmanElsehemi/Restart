//
//  CustomTabBarControllerViewController.swift
//  Restart Task
//
//  Created by Abdelrahman on 8/27/20.
//  Copyright © 2020 abdelrahman. All rights reserved.
//

import UIKit
protocol MiddleButtonDelegate : AnyObject{
    func btnMiddleTapped(from: CustomTabBarControllerViewController)

}
class CustomTabBarControllerViewController: UITabBarController {


     weak var delegatee: MiddleButtonDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupMiddleButton()
    }
    
    func setupMiddleButton() {
        
        
        let menuButton = UIButton(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
        var menuButtonFrame = menuButton.frame
        menuButtonFrame.origin.y = view.bounds.height - menuButtonFrame.height - 50
        menuButtonFrame.origin.x = view.bounds.width/2 - menuButtonFrame.size.width/2
        menuButton.frame = menuButtonFrame

        menuButton.layer.cornerRadius = menuButtonFrame.height/2
        view.addSubview(menuButton)

        menuButton.setImage(UIImage(named: "bellman_bottom-icon"), for: .normal)
        menuButton.addTarget(self, action: #selector(menuButtonAction(sender:)), for: .touchUpInside)

       view.layoutIfNeeded()
        
      

    }

    @objc private func menuButtonAction(sender: UIButton) {
        delegatee?.btnMiddleTapped(from: self)
    }




}
