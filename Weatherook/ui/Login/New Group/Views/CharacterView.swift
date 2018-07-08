//
//  Signup3ViewController.swift
//  Weatherook
//
//  Created by 양어진 on 2018. 7. 3..
//  Copyright © 2018년 이영준. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class CharacterView: UIView {
    
    @IBOutlet weak var txtSignupHeight: UITextField!
    @IBOutlet weak var txtSingupWeight: UITextField!
    @IBOutlet weak var imgSingupWoman: UIImageView!
    @IBOutlet weak var imgSignupMan: UIImageView!
    
    func getCharRx() -> (Observable<String?>,Observable<String?>){
        return  (txtSignupHeight.rx.text.asObservable(),txtSingupWeight.rx.text.asObservable())
    }
    

    
}
