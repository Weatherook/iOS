//
//  Signup2ViewController.swift
//  Weatherook
//
//  Created by 양어진 on 2018. 7. 3..
//  Copyright © 2018년 이영준. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
class AgeView: UIView {
    
    @IBOutlet weak var txtSignupAge: UITextField!
    
    @IBOutlet weak var btnVtg: UIButton!
    @IBOutlet weak var btnStl: UIButton!
    @IBOutlet weak var btnCls: UIButton!
    @IBOutlet weak var btnMd: UIButton!
    @IBOutlet weak var btnCsa: UIButton!
    @IBOutlet weak var btnYs: UIButton!
    @IBOutlet weak var btnSp: UIButton!
    @IBOutlet weak var btnDandy: UIButton!
    @IBOutlet weak var btnLmt: UIButton!
    @IBOutlet weak var btnEtc: UIButton!
    @IBOutlet weak var btnSignupSubmit: UIButton!
    
    func getAgeRx() -> Observable<String?>{
        return txtSignupAge.rx.text.asObservable()
    }
}

