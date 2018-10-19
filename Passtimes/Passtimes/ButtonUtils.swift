//
//  ButtonUtils.swift
//  Passtimes
//
//  Created by codenroot on 10/19/18.
//  Copyright © 2018 passtimes. All rights reserved.
//

import UIKit

class ButtonUtils {
    
    public static func roundedButtonMapper(button: UIButton) {
        button.layer.cornerRadius = 7.5
        button.clipsToBounds = true;
    }
}
