//
//  SignupScrollViewController.swift
//  Weatherook
//
//  Created by 이영준 on 2018. 7. 5..
//  Copyright © 2018년 이영준. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import Swinject
import SwinjectAutoregistration
import SwinjectStoryboard

class SignupScrollViewController: UIViewController {

    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var pageControll: UIPageControl!
    
    var signupSlide : SignupView?
    var characterSlide : CharacterView?
    var ageSlide : AgeView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollview.delegate = self
        let slides : [UIView] = createSlides()
        setupSlideScrollView(slides: slides)
        bind()
        
        // Do any additional setup after loading the view.
    }
}

// View 관련

extension SignupScrollViewController {
    func bind(){
//         let id = signupSlide?.txtSignupId.rx.text.asObservable(),
//         let ps = signupSlide?.txtSignupPs.rx.text.distinctUntilChanged(),
//         let pscf = signupSlide?.txtSignupPscf.rx.text.distinctUntilChanged(),
//         let ht = characterSlide?.txtSignupHeight.rx.text.distinctUntilChanged(),
//         let wt = characterSlide?.txtSingupWeight.rx.text.distinctUntilChanged(),
//         let age = ageSlide?.txtSignupAge.rx.text.distinctUntilChanged()
       
//        Observable.combineLatest(signupSlide?.txtSignupId.rx.text.asObservable(),
//                                                                  signupSlide?.txtSignupPs.rx.text.asObservable(),
//                                         signupSlide?.txtSignupPscf.rx.text.asObservable(),
//                                         characterSlide?.txtSignupHeight.rx.text.asObservable(),
//                                         characterSlide?.txtSingupWeight.rx.text,
//                                         ageSlide?.txtSignupAge.rx.text)
//        Observable.combineLatest(temp[0],temp[1],temp[2]){ (a,b,c) in (a,b) }.subscribe{
//
//            Observable.combineLatest(temp[0], temp[1], temp[2], resultSelector: { (a1, a2, a3) in
//                return (a1,a2,a3)
//            })
//        }
//                                 signupSlide?.txtSignupId.rx.text.distinctUntilChanged(),
//                                 signupSlide?.txtSignupPs.rx.text,
//                                 signupSlide?.txtSignupPscf.rx.text,
//                                 characterSlide?.txtSignupHeight.rx.text,
//                                 characterSlide?.txtSingupWeight.rx.text,
//                                 ageSlide?.txtSignupAge.rx.text){
//                                    ($0,$1,$2,$3,$4,$5,$6)}
    }
}

// 스크롤뷰와 페이징 관련
extension SignupScrollViewController {
    func createSlides() -> [UIView] {
        signupSlide = Bundle.main.loadNibNamed("SignupView", owner: self, options: nil)![0] as! SignupView
        characterSlide = Bundle.main.loadNibNamed("CharacterView", owner: self, options: nil)![0] as! CharacterView
        ageSlide =  Bundle.main.loadNibNamed("AgeView", owner: self, options: nil)![0] as! AgeView
        return [signupSlide!,characterSlide!,ageSlide!]
    }
    
    func setupSlideScrollView(slides : [UIView]){
        scrollview.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollview.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        scrollview.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width , height: view.frame.height)
            scrollview.addSubview(slides[i])
        }
    }
}

// Page Controll 관련
extension SignupScrollViewController : UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        
        pageControll.currentPage = Int(pageIndex)
        pageControll.currentPageIndicatorTintColor = UIColor(red:0.45, green:0.09, blue:1.00, alpha:1.00)
        pageControll.pageIndicatorTintColor = UIColor(red:0.93, green:0.93, blue:0.93, alpha:1.00)
        
        scrollView.isDirectionalLockEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
    }
}
