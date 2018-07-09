//
//  BoardDriver.swift
//  Weatherook
//
//  Created by 이영준 on 2018. 7. 9..
//  Copyright © 2018년 이영준. All rights reserved.
//

import Foundation
import RxSwift
class EventDriver : EventDriverDelegate{
    var userDriver: BehaviorSubject<String> = BehaviorSubject<String>.create()
    var boardDriver: BehaviorSubject<String> = BehaviorSubject<String>.create()
}