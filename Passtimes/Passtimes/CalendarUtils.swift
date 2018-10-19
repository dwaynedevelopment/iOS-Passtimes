//
//  CalendarUtils.swift
//  Passtimes
//
//  Created by Giorgio Doganiero on 10/19/18.
//  Copyright © 2018 passtimes. All rights reserved.
//

import Foundation

class CalendarUtils {

    public static func getMonthFromDate(_ millis: Int) -> String {
        let date = Date(timeIntervalSince1970: (Double)(millis / 1000))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM"
        return dateFormatter.string(from: date)
    }

    public static func getDayFromDate(_ millis: Int) -> String {
        let date = Date(timeIntervalSince1970: (Double)(millis / 1000))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        return dateFormatter.string(from: date)
    }

    public static func getTimeFromDate(_ millis: Int) -> String {
        let date = Date(timeIntervalSince1970: (Double)(millis / 1000))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE hh:mm aa"
        return dateFormatter.string(from: date)
    }

}
