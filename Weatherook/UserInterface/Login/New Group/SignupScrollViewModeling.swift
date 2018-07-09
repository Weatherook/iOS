//
//  SignupScrollViewModeling.swift
//  Weatherook
//
//  Created by 이영준 on 2018. 7. 6..
//  Copyright © 2018년 이영준. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

// Signup 에 들어가는 Observable과 View들에 대한 정의
protocol SignupScrollViewModeling {
    var obs : Observable<[String?]> {get}
    var viewList : [UIView] {get}
    

}
