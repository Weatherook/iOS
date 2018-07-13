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
    
    
    @IBOutlet weak var btnMan: ManButton!
    @IBOutlet weak var btnWoman: WomanButton!
    @IBOutlet weak var txtSignupHeight: UITextField!
    @IBOutlet weak var txtSignupWeight: UITextField!
    var bool : (Bool , Bool) = (false,false)
    override func awakeFromNib() {
        super.awakeFromNib()
        Observable.combineLatest(
            btnMan.rx.tap.map{[weak self] in self?.btnMan},
            btnWoman.rx.tap.map{[weak self] in self?.btnWoman}
            ).subscribe{ [weak self] tuple in
                guard let tuple = tuple.element as? (ManButton, WomanButton) else{
                    return
                }
                if tuple.0.isClicked && tuple.1.isClicked {
                    if (self?.bool.1)! {
                        self?.btnWoman.setBackgroundImage(#imageLiteral(resourceName: "joinWomanNo"), for: .normal)
                        self?.btnWoman.isClicked = false
                    }else if (self?.bool.0)! {
                        self?.btnMan.setBackgroundImage(#imageLiteral(resourceName: "joinManNo"), for: .normal)
                        self?.btnMan.isClicked = false
                    }
                }
                self?.bool = (tuple.0.isClicked, tuple.1.isClicked)
                let gender = [self?.bool.1,self?.bool.0]
                print(gender)
                genderDriver.onNext(gender as! [Bool])
        }
        
        firstButtonSetting()

        
    }
    
    func getCharRx() -> (Observable<String?>,Observable<String?>){
        return  (txtSignupHeight.rx.text.asObservable(),txtSignupWeight.rx.text.asObservable())
    }
    

    func getBtnRx() -> Observable<[Void]>{
        return Observable.combineLatest(btnMan.rx.tap, btnWoman.rx.tap){
            [$0,$1]
        }
    }
//
//    func setImage(){
//        btnMan.setBackgroundImage(#imageLiteral(resourceName: "joinManNo"), for: .normal)
//        btnWoman.setBackgroundImage(#imageLiteral(resourceName: "joinManNo"), for: .normal)
//    }
    
    func firstButtonSetting(){
        for _ in (1...2){
            btnMan.sendActions(for: .touchUpInside)
            btnWoman.sendActions(for: .touchUpInside)
        }
    }
}

