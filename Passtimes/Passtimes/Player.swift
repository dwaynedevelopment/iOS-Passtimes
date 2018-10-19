//
//  Player.swift
//  Passtimes
//
//  Created by codenroot on 10/19/18.
//  Copyright © 2018 passtimes. All rights reserved.
//

import UIKit

public class Player {
    var id: String
    var name: String
    var thumbnail: String
    
    init(id: String, name: String, thumbnail: String) {
        self.id = id
        self.name = name
        self.thumbnail = thumbnail
    }
    
    var getId: String {
        get {
           return self.id
        }
    }
    
    var getName: String {
        get {
            return self.name
        }
    }
    
    var getThumbnail: String {
        get {
            return self.thumbnail
        }
    }
    
}
