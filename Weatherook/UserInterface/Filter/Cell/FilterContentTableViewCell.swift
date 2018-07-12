//
//  FilterContentTableViewCell.swift
//  Weatherook
//
//  Created by 양어진 on 2018. 7. 11..
//  Copyright © 2018년 이영준. All rights reserved.
//

import UIKit

class FilterContentTableViewCell: UITableViewCell {

    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var btnID: UIButton!
    @IBOutlet weak var btnHeart: UIButton!
    @IBOutlet weak var labelHeart: UILabel!
    @IBOutlet weak var imgContent: UIImageView!
    
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelArea: NSLayoutConstraint!
    @IBOutlet weak var labelTemp: UILabel!
    @IBOutlet weak var labelWeather: UILabel!
    @IBOutlet weak var btnBottomSheet: UIButton!
    
    @IBOutlet weak var labelWriting: UILabel!
    @IBOutlet weak var btnMoreComment: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
