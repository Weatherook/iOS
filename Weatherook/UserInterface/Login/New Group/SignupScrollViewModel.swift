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
    var api : SignApiProtocol
    
    init(api : SignApiProtocol) {
        self.api = api
        signupSlide = Bundle.main.loadNibNamed("SignupView", owner: self, options: nil)![0] as! SignupView
        characterSlide = Bundle.main.loadNibNamed("CharacterView", owner: self, options: nil)![0] as! CharacterView
        ageSlide =  Bundle.main.loadNibNamed("AgeView", owner: self, options: nil)![0] as! AgeView
        bind()
    }
    
    func tese(){
        print(ageSlide?.btnMd.isSelected)
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


extension SignupScrollViewModel{
    func bind(){
        let srx = signupSlide?.getSignUpRx()
        let btns = ageSlide?.getButton()
        let submit = ageSlide?.getSubmit()
        
        signupSlide?.txtSignupId.rx.text.subscribe{ event in
            let txt = event.element!
            if txt!.count < 10 {
                self.signupSlide?.labelSignupInfo.text = "10자 이상 입력해주세요"
            }else if txt!.index(of: "@") == nil {
                self.signupSlide?.labelSignupInfo.text = "이메일 형식이 아닙니다"
            }else{
                self.signupSlide?.labelSignupInfo.text = "옳바른 이메일 형식입니다"
            }
        }
        
        signupSlide?.txtSignupPs.rx.text.subscribe{ event in
            let txt = event.element!
            if txt!.count < 10{
                self.signupSlide?.labelSignupInfo.text = "비밀번호를 10자 이상 입력해주세요"
            }
        }
        Observable.combineLatest(srx!.0, srx!.1) { [$0,$1] }.subscribe{ event in
            let temp = event.element!
            if temp[0] != temp[1] {
                self.signupSlide?.labelSignupInfo.text = "비밀번호가 일치하지 않습니다"
            } else if temp[0] == "" {
                self.signupSlide?.labelSignupInfo.text = "아이디와 패스워드를 입력해주세요"
            } else {
                self.signupSlide?.labelSignupInfo.text = "비밀번호가 일치합니다"
            }
        }
        
//        characterSlide?.btnMan.rx.tap.subscribe{
//            if gender == (true, false){
//                genderImage.setImage(#imageLiteral(resourceName: "manClicked"), for: .normal)
//            }else if gender == (false, true){
//                genderImage.setImage(#imageLiteral(resourceName: "girlClicked"), for: .normal)
//            }else{
//                print("잘못전달됌")
//            }
//        }
        
//
//        Observable.combineLatest(btns![0]!.rx.tap,
//                                 btns![1]!.rx.tap,
//                                 btns![2]!.rx,
//                                 btns![3]!.rx,
//                                 btns![4]!.rx,
//                                 btns![5]!.rx,
//                                 btns![6]!.rx,
//                                 btns![7]!.rx)
        
    }
}
