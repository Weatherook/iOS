//
//  EventDriverDelegate.swift
//  Weatherook
//
//  Created by 이영준 on 2018. 7. 9..
//  Copyright © 2018년 이영준. All rights reserved.
//

import Foundation
import RxSwift
protocol EventDrivable {
    var TempDriver : BehaviorSubject<String> {get}
}
