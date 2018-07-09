//
//  ViewControllerInjector.swift
//  Weatherook
//
//  Created by 이영준 on 2018. 7. 5..
//  Copyright © 2018년 이영준. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import Swinject
import SwinjectAutoregistration
import SwinjectStoryboard


extension SwinjectStoryboard{
    @objc class func setup() {
        
        /*Event 드라이버*/
        defaultContainer.autoregister(NetworkDrivable.self, initializer: NetworkDriver.init)
        defaultContainer.autoregister(EventDrivable.self, initializer: EventDriver.init)
        
        
        /*스토리보드 인젝션*/
        defaultContainer.storyboardInitCompleted(SignupScrollViewController.self) { (r, c) in c.model = r~> } // 내려받는거
        
        /*뷰모델*/
        defaultContainer.autoregister(SignupScrollViewModeling.self, initializer: SignupScrollViewModel.init) // 올리는거
    }
}



