//
//  LoginViewController.swift
//  Weatherook
//
//  Created by 양어진 on 2018. 7. 2..
//  Copyright © 2018년 이영준. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import Swinject
import SwinjectAutoregistration
import SwinjectStoryboard
import Hero
import Toaster
import Alamofire
import CoreLocation

class LoginViewController: UIViewController {

    @IBOutlet weak var txtLoginId: UITextField!
    @IBOutlet weak var txtLoginPw: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnLoginSignup: UIButton!
    
    var account = ["",""]
    
    var viewModel : LoginViewModeling?
    
    var signApi : SignApiProtocol?
    var commonApi : CommonApiProtocol?
    var weatherApi : WeatherApiProtocol?
    var UserApi : UserApiProtocol?
    var commentApi : CommentApiProtocol?
    var boardApi : BoardApiProtocol?
    
    var driver : NetworkDriver?
    override func viewDidLoad() {
        super.viewDidLoad()
        getNetwork()
        bind()
    }
}


extension LoginViewController{
    func bind(){
        let _ = Observable.combineLatest(txtLoginId.rx.text, txtLoginPw.rx.text) { [$0,$1]}.subscribe{ [weak self] event in
            guard let ele = event.element else {
                return
            }
            self?.account = ele as! [String]
            print(self?.account)
        }
        
        let _ = btnLogin.rx.tap.subscribe{ [weak self] event in
            self?.viewModel?.api.signin(user_id: (self?.account[0])!, user_pw: (self?.account[1])!).responseJSON{ res in
                print("\((self?.account[0])!) / \((self?.account[1])!)")
                switch res.response?.statusCode {
                    
                    case 201 :
                        let token = try! JSONDecoder().decode(SignModel.self, from: res.data!)
                        headers = [
                            "token" : token.token!,
                            "Content_Type" : "application/x-www-form-urlencoded"
                        ]
                        self?.onSuccess()
                    default :
                        Toast(text : "일치하는 정보가 없습니다").show()
                }
            }
        }
        
        
        let _ = btnLoginSignup.rx.tap.subscribe{ event in
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignupScrollViewController") as? SignupScrollViewController
            vc?.isHeroEnabled = true
            vc?.heroModalAnimationType = .zoom
            self.hero_replaceViewController(with: vc!)
        }
    }
    func onSuccess(){
    
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainTabBarViewController") as? MainTabBarViewController
        vc?.isHeroEnabled = true
        vc?.heroModalAnimationType = .fade
        self.hero_replaceViewController(with: vc!)
    }
}

extension LoginViewController{
    func getNetwork(){
        weatherApi?.getWeatherList(x: testLocation[0], y: testLocation[1]).responseJSON{ res in
            let temp = try! JSONDecoder().decode(WeatherListModel.self, from: res.data!)
            print(temp)
            print(temp.data?[0].hour)
            weatherListDriver.onNext(temp)
        }
    }
}

extension LoginViewController : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationDriver.onNext([(locations.last?.coordinate.latitude)!,(locations.last?.coordinate.longitude)!])
    }
}
