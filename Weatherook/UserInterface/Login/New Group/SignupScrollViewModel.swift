//
//  SignupScrollerViewModel.swift
//  Weatherook
//
//  Created by 이영준 on 2018. 7. 6..
//  Copyright © 2018년 이영준. All rights reserved.
//

import Foundation
import RxSwift

struct SignupScrollViewModel: SignupScrollViewModeling {
    
    fileprivate var signupSlide : SignupView?
    fileprivate var characterSlide : CharacterView?
    fileprivate var ageSlide : AgeView?
    
    var obs: Observable<[String?]> {return createObs()}
    var viewList: [UIView] {return createSlides()}
     
    init() {
        signupSlide = Bundle.main.loadNibNamed("SignupView", owner: self, options: nil)![0] as! SignupView
        characterSlide = Bundle.main.loadNibNamed("CharacterView", owner: self, options: nil)![0] as! CharacterView
        ageSlide =  Bundle.main.loadNibNamed("AgeView", owner: self, options: nil)![0] as! AgeView
    }
    
    func createSlides() -> [UIView] {
        return [signupSlide!,characterSlide!,ageSlide!]
    }
    
    func createObs() -> Observable<[String?]>{
        let srx = signupSlide?.getSignUpRx()
        let brx = characterSlide?.getCharRx()
        let crx = ageSlide?.getAgeRx()
        return Observable.combineLatest(srx!.0,srx!.1,srx!.2,brx!.0,brx!.1,crx!){ [$0,$1,$2,$3,$4,$5] }
    }
}
