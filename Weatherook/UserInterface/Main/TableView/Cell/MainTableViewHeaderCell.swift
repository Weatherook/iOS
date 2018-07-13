//
//  MainTableViewHeaderCell.swift
//  Weatherook
//
//  Created by 양어진 on 2018. 7. 5..
//  Copyright © 2018년 이영준. All rights reserved.
//

import UIKit

class MainTableViewHeaderCell: UITableViewCell {

    @IBOutlet weak var btnPopular: UIButton!
    @IBOutlet weak var btnLastest: UIButton!
    @IBOutlet weak var followingView: UIView!
    @IBOutlet weak var todayView: UIView!
    @IBOutlet weak var btnToday: UIButton!
    @IBOutlet weak var btnFollowing: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
