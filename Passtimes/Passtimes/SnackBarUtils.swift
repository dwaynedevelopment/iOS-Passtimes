//
//  SnackBarUtils.swift
//  Passtimes
//
//  Created by codenroot on 10/19/18.
//  Copyright © 2018 passtimes. All rights reserved.
//

import UIKit
import MaterialComponents

class SnackbarUtils {
    
    public static func invokeSnackbar(message: String) {
        let snackbar = MDCSnackbarMessage()
        snackbar.text = message
        MDCSnackbarManager.show(snackbar)
    }
    
    
}
