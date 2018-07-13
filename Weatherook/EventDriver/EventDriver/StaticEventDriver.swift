//
//  StaticEventDriver.swift
//  Weatherook
//
//  Created by 이영준 on 2018. 7. 13..
//  Copyright © 2018년 이영준. All rights reserved.
//

import Foundation
import RxSwift

let genderDriver: BehaviorSubject<[Bool]> = BehaviorSubject(value: [true,false])
let styleDriver: BehaviorSubject<[String]> = BehaviorSubject(value: ["댄디"])
let tempDriver: BehaviorSubject<String> = BehaviorSubject(value: "DD")
let boardDriver : BehaviorSubject<BoardModel?> = BehaviorSubject(value: nil)


let locationDriver : BehaviorSubject<[Double]?> = BehaviorSubject(value: [37.507505, 127.045762])
