//
//  DatabaseUtils.swift
//  Passtimes
//
//  Created by Giorgio Doganiero on 10/19/18.
//  Copyright © 2018 passtimes. All rights reserved.
//

import Foundation
import FirebaseDatabase

class DatabaseUtils {

    private let db: Database!

    // Get class Instance
    class var sharedInstance: DatabaseUtils {
        struct Static {
            static let instance = DatabaseUtils()
        }
        return Static.instance
    }

    private init() {
        db = Database.database()
    }

    public func reference() -> DatabaseReference {
        return db.reference()
    }

}
