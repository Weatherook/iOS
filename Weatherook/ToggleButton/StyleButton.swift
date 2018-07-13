//
//  StyleButton.swift
//  Weatherook
//
//  Created by 이영준 on 2018. 7. 13..
//  Copyright © 2018년 이영준. All rights reserved.
//

import UIKit

class StyleButton: UIButton {
    
    var isClicked = false
    override init(frame: CGRect) {
        super.init(frame: frame)
        initButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initButton()
    }
    
    func initButton() {
        addTarget(self, action: #selector(StyleButton.buttonPressed), for: .touchUpInside)
    }
    
    
    @objc func buttonPressed(){
        activateButton(bool: !isClicked)
    }
    
    func activateButton(bool : Bool){
        isClicked = bool
        switch self.backgroundImage(for: .normal) {
        case #imageLiteral(resourceName: "style") :
            self.setTitleColor(UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.00), for: .normal)
            self.setBackgroundImage(#imageLiteral(resourceName: "stylePurple"), for: .normal)
        case #imageLiteral(resourceName: "stylePurple"):
            self.setTitleColor(UIColor(red:0.70, green:0.70, blue:0.70, alpha:1.00), for: .normal)
            self.setBackgroundImage(#imageLiteral(resourceName: "style"), for: .normal)
        default:
            print("에러")
        }
    }
}
