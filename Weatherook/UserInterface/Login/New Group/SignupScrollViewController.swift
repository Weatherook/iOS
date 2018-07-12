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
        print("=========================")
        bind()
        test()
        // Do any additional setup after loading the view.
    }
}

// View 관련
func test(){
    
    let b = CommonApi()
    let c = CommentApi()
    let d = CommonApi()
    let e = WeatherApi()
    let a = SignApi()
    
    
    
//    b.retreiveCommend(x: testLocation[0], y: testLocation[1], date_type: .today).responseJSON{
//        print($0)
//    }
//    e.getWeatherList(x: testLocation[0], y: testLocation[1]).response{ print(String(data : $0.data!, encoding : .utf8)) }
//    d.postLike(board_idx: 1).responseJSON{print("postLike : \($0)")}
//    d.retreiveCommend(x: testLocation[0], y: testLocation[1], date_type: .today).responseJSON { print("retreiveCommend : \($0)")}
//    e.getWeather(x: testLocation[0], y: testLocation[1], date_type: .tomorrow).responseJSON {print("getWeather : \($0)")}
//    e.getWeatherComment(weather_temp: 25, weather_weather: .veryCloudy).responseJSON {print("getWeatherComment : \($0)")}
//    e.getWeatherList(x: testLocation[0], y: testLocation[1]).responseJSON {print("getWeatherList : \($0)")}
//    e.weather3hours(x: testLocation[0], y: testLocation[1]).responseJSON {print("3hours : \($0)")}
//    b.postLike(board_idx: 1).responseJSON{print($0)}
//    c.getComment(comment_idx: 1, board_idx: 3).responseJSON{print($0)}
//    c.postComment(board_idx: 1, desc: "허허하하하하하하허하허iOS").responseJSON{print($0)}
//    c.putComment(board_idx: 1, comment_desc: "히히허허앗수정", comment_idx: 3).responseJSON{print($0)}
//    let a = SignApi()
//    a.signup(user_id: "dldudwns@naver.com", user_pw: "dfkajldlal", user_gender: "남", user_age: 21, user_height: 180, user_weight: 80, user_stylelist: ["댄디","빈티지"]).responseJSON{print($0)}
//    a.signin(user_id: "Dddd", user_pw: "pwsd").responseJSON{ print($0)}
    

    
}

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
