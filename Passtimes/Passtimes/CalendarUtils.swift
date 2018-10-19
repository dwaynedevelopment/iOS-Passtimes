//
//  CalendarUtils.swift
//  Passtimes
//
//  Created by Giorgio Doganiero on 10/19/18.
//  Copyright © 2018 passtimes. All rights reserved.
//

import Foundation

class CalendarUtils {

    public static func getMonthFromDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM"
        return dateFormatter.string(from: date)
    }

    public static func getDayFromDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        return dateFormatter.string(from: date)
    }

}
