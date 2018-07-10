//
//  UserApiProtocol.swift
//  Weatherook
//
//  Created by 이영준 on 2018. 7. 10..
//  Copyright © 2018년 이영준. All rights reserved.
//

import Foundation

protocol UserApiProtocol {
    
    func news()
    func show()
    func list()
    
    func postFollow()
    func follower()
    func following()
    
    func getSetting()
    func setSetting()
    
}
