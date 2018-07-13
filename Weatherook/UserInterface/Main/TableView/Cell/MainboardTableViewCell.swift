//
//  MainboardTableViewCell.swift
//  Weatherook
//
//  Created by 양어진 on 2018. 7. 5..
//  Copyright © 2018년 이영준. All rights reserved.
//

import UIKit

class MainboardTableViewCell: UITableViewCell {

    @IBOutlet weak var imgMain: UIImageView!
    @IBOutlet weak var imgDesc: UILabel!
    
    @IBOutlet weak var txtDate: UILabel!
    
    @IBOutlet weak var txtLocation: UILabel!
    @IBOutlet weak var txtTemp: UILabel!
    
    @IBOutlet weak var txtMaxMin: UILabel!
    
    @IBOutlet weak var txtWeather: UILabel!
    @IBOutlet weak var btnMore: UIButton!
    @IBOutlet weak var btnThrum: UIImageView!
    
    @IBOutlet weak var btnEtc: UIButton!
    
    @IBOutlet weak var btnId: UIButton!
    @IBOutlet weak var btnLike: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
