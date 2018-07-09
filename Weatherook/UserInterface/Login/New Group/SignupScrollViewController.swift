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
    
    var model : SignupScrollViewModeling?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollview.delegate = self
        setupSlideScrollView(slides: (model?.viewList)!)
        bind()
        
        // Do any additional setup after loading the view.
    }
}

// View 관련

extension SignupScrollViewController {
    func bind(){
        let _ = model?.obs.subscribe{ [weak self] event in
                guard let tuple = event.element else {
                    return
                }
                print(tuple)
        }
    }
}

// 스크롤뷰와 페이징 관련
extension SignupScrollViewController {
    
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
