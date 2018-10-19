//
//  Event.swift
//  Passtimes
//
//  Created by Giorgio Doganiero on 10/19/18.
//  Copyright © 2018 passtimes. All rights reserved.
//

import Foundation

class Event: NSObject {

    var id: String?
    var hostId: String?
    var hostThumbnail: String?
    var sport: String?
    var title: String?
    var latitude: Double?
    var longitude: Double?
    var location: String?
    var startDate: CLong?
    var endDate: CLong?
    var maxPlayers: Int?

//    init(id: String, hostId: String, hostThumbnail: String, sport: String, title:String, latitude: Double, longitude: Double, location: String, startDate: Int, endDate: Int, maxPlayers: Int) {
//        self.id = id
//        self.hostId = hostId
//        self.hostThumbnail = hostThumbnail
//        self.sport = sport
//        self.title = title
//        self.latitude = latitude
//        self.longitude = longitude
//        self.location = location
//        self.startDate = startDate
//        self.endDate = endDate
//        self.maxPlayers = maxPlayers
//    }


// THIS MIGHT GIVE PROBLEM
// private long startDate;
// private long endDate;
// private HashMap<String, HashMap<String, String>> playerList;
}
