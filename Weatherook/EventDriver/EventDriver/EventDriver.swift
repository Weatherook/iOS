//
//  EventDriver.swift
//  Weatherook
//
//  Created by 이영준 on 2018. 7. 9..
//  Copyright © 2018년 이영준. All rights reserved.
//

import Foundation
import RxSwift

class EventDriver : EventDrivable {
    var GenderDriver: BehaviorSubject<[Bool]> = BehaviorSubject(value: [true,false])
    
    var StyleDriver: BehaviorSubject<[String]> = BehaviorSubject(value: ["댄디"])
    
    var TempDriver: BehaviorSubject<String> = BehaviorSubject(value: "DD")
    
    
}
