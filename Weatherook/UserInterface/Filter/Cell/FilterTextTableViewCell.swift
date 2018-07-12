//
//  FilterTextTableViewCell.swift
//  Weatherook
//
//  Created by 양어진 on 2018. 7. 11..
//  Copyright © 2018년 이영준. All rights reserved.
//

import UIKit

class FilterTextTableViewCell: UITableViewCell {

    @IBOutlet weak var labelGender: UILabel!
    @IBOutlet weak var labelHeight: UILabel!
    @IBOutlet weak var labelStyle: UILabel!
    @IBOutlet weak var labelWeightType: UILabel!
    @IBOutlet weak var labelTemp: UILabel!
    @IBOutlet weak var labelWeather: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
