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
        
        defaultContainer.autoregister(SignupScrollViewModeling.self, initializer: SignupScrollViewModel.init)
        
        defaultContainer.storyboardInitCompleted(SignupScrollViewController.self) { (r, c) in c.model = r~> }
        
    }
}



