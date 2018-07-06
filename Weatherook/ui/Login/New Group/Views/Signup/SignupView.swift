
//
//  SignupViewController.swift
//  Weatherook
//
//  Created by 양어진 on 2018. 7. 2..
//  Copyright © 2018년 이영준. All rights reserved.
//

import UIKit
import RxSwift
class SignupView: UIView {
    @IBOutlet weak var txtSignupId: UITextField!
    @IBOutlet weak var txtSignupPs: UITextField!
    @IBOutlet weak var txtSignupPscf: UITextField!
    func getSignUpRx() -> Observable<(String?,String?,String?)>{
        let temp =  Observable.combineLatest(txtSignupId.rx.text.asObservable(),
                                 txtSignupPs.rx.text.asObservable(),
                                 txtSignupPscf.rx.text.asObservable()){($0,$1,$2)}
        return temp
    }

}
