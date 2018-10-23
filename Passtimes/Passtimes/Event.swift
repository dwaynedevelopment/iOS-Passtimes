//
//  Event.swift
//  Passtimes
//
//  Created by Giorgio Doganiero on 10/19/18.
//  Copyright © 2018 passtimes. All rights reserved.
//

import Foundation
import FirebaseFirestore

enum ParsingError: Error {
    case Event
}

class Event {

    let id: String
    let hostId: String
    let hostThumbnail: String
    let sport: String
    let title: String
    let latitude: Double
    let longitude: Double
    let location: String
    let startDate: Int
    let endDate: Int
    let maxPlayers: Int
    let attendees: [DocumentReference]

//    init(dictionary: [String: Any]) throws {
//        guard let id = dictionary["id"] as? String,
//            let hostId = dictionary["hostId"] as? String,
//            let hostThumbnail = dictionary["hostThumbnail"] as? String,
//            let sport = dictionary["sport"] as? String,
//            let title = dictionary["title"] as? String,
//            let latitude = dictionary["latitude"] as? Double,
//            let longitude = dictionary["longitude"] as? Double,
//            let location = dictionary["location"] as? String,
//            let startDate = dictionary["startDate"] as? Int,
//            let endDate = dictionary["endDate"] as? Int,
//            let maxPlayers = dictionary["maxPlayers"] as? Int
//            else { throw ParsingError.Event }
//
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

    init(id: String, hostId: String, hostThumbnail: String, sport: String, title:String, latitude: Double, longitude: Double, location: String, startDate: Int, endDate: Int, maxPlayers: Int) {
        self.id = id
        self.hostId = hostId
        self.hostThumbnail = hostThumbnail
        self.sport = sport
        self.title = title
        self.latitude = latitude
        self.longitude = longitude
        self.location = location
        self.startDate = startDate
        self.endDate = endDate
        self.maxPlayers = maxPlayers
        self.attendees = []
    }


// THIS MIGHT GIVE PROBLEM
// private long startDate;
// private long endDate;
// private HashMap<String, HashMap<String, String>> playerList;
}
