//
//  ProfileVIewController.swift
//  Passtimes
//
//  Created by codenroot on 10/19/18.
//  Copyright © 2018 passtimes. All rights reserved.
//

import UIKit
import Kingfisher

class ProfileVIewController: UIViewController {
    
    @IBOutlet weak var profileDisplayName: UILabel!
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        if AuthUtils.isUserCurrentlySignedIn() {
            let url = URL(string: AuthUtils.getCurrentSignedUser().getThumbnail)
            profileImageView.layer.masksToBounds = false
            profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2
            profileImageView.clipsToBounds = true
            profileImageView.kf.setImage(with: url)
            profileDisplayName.text = AuthUtils.getCurrentSignedUser().getName
        
        }

        
    }

    
}
