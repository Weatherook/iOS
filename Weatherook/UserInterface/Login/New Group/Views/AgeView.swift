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
    
    @IBOutlet weak var btnVtg: StyleButton!
    @IBOutlet weak var btnStl: StyleButton!
    @IBOutlet weak var btnCls: StyleButton!
    @IBOutlet weak var btnMd: StyleButton!
    @IBOutlet weak var btnCsa: StyleButton!
    @IBOutlet weak var btnYs: StyleButton!
    @IBOutlet weak var btnSp: StyleButton!
    @IBOutlet weak var btnDandy: StyleButton!
    @IBOutlet weak var btnLmt: StyleButton!
    @IBOutlet weak var btnEtc: StyleButton!
    @IBOutlet weak var btnSignupSubmit: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let arr = [btnVtg,btnStl,btnCls,btnMd,
                   btnCsa,btnYs,btnSp,btnDandy,btnLmt,
                   btnEtc,btnEtc]
        btnSignupSubmit.rx.tap.subscribe{
//            print("<#T##items: Any...##Any#>")
//            let arr2 = [btnVtg,btnStl,btnCls,btnMd,
//                       btnCsa,btnYs,btnSp,btnDandy,btnLmt,
//                       btnEtc,btnEtc].filter{ ($0?.isClicked)! }.map{ $0?.title(for: .normal)}
            print(arr)
        }
        
    }
    func getAgeRx() -> Observable<String?>{
        
        return txtSignupAge.rx.text.asObservable()
    }

    func getButton() -> [UIButton?]{
        return [btnVtg,btnStl,btnCls,btnMd,btnCsa,btnYs,btnSp,btnDandy,btnLmt,btnEtc,btnEtc]
    }
    func getSubmit() -> UIButton{
        return btnSignupSubmit
    }
    
//    func getButtonRx() -> Observable<[UIButton]>{
//        
//    }
}

