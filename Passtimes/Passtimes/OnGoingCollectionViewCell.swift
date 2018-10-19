//
//  OnGoingCollectionViewCell.swift
//  Passtimes
//
//  Created by Giorgio Doganiero on 10/19/18.
//  Copyright © 2018 passtimes. All rights reserved.
//

import UIKit

class OnGoingCollectionViewCell: UICollectionViewCell {

    @IBOutlet var cardView: UIView!
    @IBOutlet var sport: UILabel!
    @IBOutlet var title: UILabel!
    @IBOutlet var location: UILabel!
    @IBOutlet var time: UILabel!
    @IBOutlet var month: UILabel!
    @IBOutlet var day: UILabel!
    //@IBOutlet var cornerView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    public func configure(_ event: Event ) {
        self.sport.text = event.sport
        self.title.text = event.title
        self.location.text = event.location
        self.month.text = CalendarUtils.getMonthFromDate(event.startDate)
        self.day.text = CalendarUtils.getDayFromDate(event.startDate)
        self.time.text = CalendarUtils.getTimeFromDate(event.startDate)
    }


}
