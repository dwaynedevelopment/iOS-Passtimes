//
//  PickASportCollectionViewCell.swift
//  Passtimes
//
//  Created by Giorgio Doganiero on 10/22/18.
//  Copyright © 2018 passtimes. All rights reserved.
//

import UIKit

class PickASportCollectionViewCell: UICollectionViewCell {

    @IBOutlet var cardView: UIView!
    @IBOutlet var sportIcon: UIImageView!
    @IBOutlet var sportTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()


        self.layer.masksToBounds = false
        self.layer.cornerRadius = 7.5
        self.clipsToBounds = true
        self.layer.shadowOffset = CGSize(width: 0, height: -2)
        self.layer.shadowRadius = 7.5
        self.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.layer.shadowOpacity = 0.2
    }

    public func configure(_ sport: Sport) {
        // Set color of the sport card to idle
        self.cardView.layer.borderColor = #colorLiteral(red: 0.768627451, green: 0.768627451, blue: 0.768627451, alpha: 1)

        self.sportTitle.text = sport.name
        self.sportTitle.textColor = #colorLiteral(red: 0.768627451, green: 0.768627451, blue: 0.768627451, alpha: 1)
        // download idle sport icon
        let url = URL(string: sport.idleIconUrl)
        self.sportIcon.kf.setImage(with: url)
    }

    public func selected(_ sport: Sport) {
        // Set the border color of the sport card to active
        self.cardView.layer.borderColor = #colorLiteral(red: 0.08800473064, green: 0.808358252, blue: 0.7374972701, alpha: 1)

        self.sportTitle.text = sport.name
        self.sportTitle.textColor = #colorLiteral(red: 0.08800473064, green: 0.808358252, blue: 0.7374972701, alpha: 1)
        // download active sport icon
        let url = URL(string: sport.activeIconUrl)
        self.sportIcon.kf.setImage(with: url)
    }

}
