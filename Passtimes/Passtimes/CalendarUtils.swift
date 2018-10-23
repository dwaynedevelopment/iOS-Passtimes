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

    public static func getStartEndTimefromDate(startTime startMillis: Int, endTime endMillis: Int) -> String {
        let dateFormatter = DateFormatter()
        let startDate = Date(timeIntervalSince1970: (Double)(startMillis / 1000))
        let endDate = Date(timeIntervalSince1970: (Double)(endMillis / 1000))
        dateFormatter.dateFormat = "hh:mm aa"

        return dateFormatter.string(from: startDate) + " - " + dateFormatter.string(from: endDate)
    }

    public static func composeDate(hours: Int, minutes: Int) -> Date {


        return Date()
    }

}
