//
//  MainCommentTableViewCell.swift
//  Weatherook
//
//  Created by 양어진 on 2018. 7. 13..
//  Copyright © 2018년 이영준. All rights reserved.
//

import UIKit

class MainCommentTableViewCell: UITableViewCell {

    @IBOutlet weak var btnId: UIButton!
    @IBOutlet weak var btnComment: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
