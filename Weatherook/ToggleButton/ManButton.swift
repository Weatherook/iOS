//
//  File.swift
//  Weatherook
//
//  Created by 이영준 on 2018. 7. 13..
//  Copyright © 2018년 이영준. All rights reserved.
//

import Foundation
import UIKit

class ManButton : UIButton{
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
        addTarget(self, action: #selector(ManButton.buttonPressed), for: .touchUpInside)
    }
    
    
    @objc func buttonPressed(){
        activateButton(bool: !isClicked)
    }
    
    func activateButton(bool : Bool){
        isClicked = bool
        switch self.backgroundImage(for: .normal) {
        case #imageLiteral(resourceName: "joinManOk") :
            self.setBackgroundImage(#imageLiteral(resourceName: "joinManNo"), for: .normal)
        case #imageLiteral(resourceName: "joinManNo") :
            self.setBackgroundImage(#imageLiteral(resourceName: "joinManOk"), for: .normal)
        default:
            print("에러")
        }
    }
}

