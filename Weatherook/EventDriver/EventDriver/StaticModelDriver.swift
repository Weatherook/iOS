//
//  StaticModelDriver.swift
//  Weatherook
//
//  Created by 이영준 on 2018. 7. 13..
//  Copyright © 2018년 이영준. All rights reserved.
//

import Foundation
import RxSwift

let weatherDriver : BehaviorSubject<WeatherModel?> = BehaviorSubject(value: nil)
let weatherListDriver : BehaviorSubject<WeatherListModel?> = BehaviorSubject(value: nil)
let weatherCommentDriver : BehaviorSubject<WeatherListModel?> = BehaviorSubject(value: nil)
let weatherCommendDriver : BehaviorSubject<WeatherListModel?> = BehaviorSubject(value: nil)
let todayListDriver : BehaviorSubject<WeatherListModel?> = BehaviorSubject(value: nil)
let followDriver : BehaviorSubject<WeatherListModel?> = BehaviorSubject(value: nil)
let userNewsDriver : BehaviorSubject<WeatherListModel?> = BehaviorSubject(value: nil)
let userFlowerListDrvier : BehaviorSubject<WeatherListModel?> = BehaviorSubject(value: nil)
let userFollowingListDriver : BehaviorSubject<WeatherListModel?> = BehaviorSubject(value: nil)
