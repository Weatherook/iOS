//
//  NetworkDriver.swift
//  Weatherook
//
//  Created by 이영준 on 2018. 7. 9..
//  Copyright © 2018년 이영준. All rights reserved.
//

import Foundation
import RxSwift

class NetworkDriver : NetworkDrivable {
    var tokenDriver : BehaviorSubject<String> = BehaviorSubject(value: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkeCI6MSwiaWF0IjoxNTMxMDYwNDU2LCJleHAiOjE1MzM2NTI0NTZ9.9m9x53Lx-t1GhfifnLo2AMu4GSfapBfYtV74QCwBimg")
}
