//
//  Sport.swift
//  Passtimes
//
//  Created by Giorgio Doganiero on 10/22/18.
//  Copyright © 2018 passtimes. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class Sport {

    let id: String
    let name: String
    let idleIconUrl: String
    let activeIconUrl: String

    init(id: String, name: String, idleIconUrl: String, activeIconUrl: String) {
        self.id = id
        self.name = name
        self.idleIconUrl = idleIconUrl
        self.activeIconUrl = activeIconUrl
    }

}
