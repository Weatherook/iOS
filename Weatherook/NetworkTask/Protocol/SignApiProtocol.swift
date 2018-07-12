//
//  SignApiProtocol.swift
//  Weatherook
//
//  Created by 이영준 on 2018. 7. 13..
//  Copyright © 2018년 이영준. All rights reserved.
//

import Foundation
import Alamofire

protocol SignApiProtocol {
    
    func signin(user_id : String, user_pw:String) -> DataRequest
    func signup(user_id : String,
                user_pw: String,
                user_gender : String,
                user_age : Int,
                user_height : Int,
                user_weight : Int,
                user_stylelist : [String]) -> DataRequest
}
