//
//  WomanButton.swift
//  Weatherook
//
//  Created by 이영준 on 2018. 7. 13..
//  Copyright © 2018년 이영준. All rights reserved.
//

import Foundation
import UIKit

class WomanButton : UIButton{
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
        addTarget(self, action: #selector(WomanButton.buttonPressed), for: .touchUpInside)
    }
    
    
    @objc func buttonPressed(){
        activateButton(bool: !isClicked)
    }
    
    func activateButton(bool : Bool){
        isClicked = bool
        switch self.backgroundImage(for: .normal) {
        case #imageLiteral(resourceName: "joinWomanNo") :
            self.setBackgroundImage(#imageLiteral(resourceName: "joinWomanOk"), for: .normal)
        case #imageLiteral(resourceName: "joinWomanOk") :
            self.setBackgroundImage(#imageLiteral(resourceName: "joinWomanNo"), for: .normal)
        default:
            print("에러")
        }
    }
}
