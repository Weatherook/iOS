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
    
    func getAgeRx() -> Observable<String?>{
        let temp = txtSignupAge.rx.text.asObservable()
        return temp    }
}

