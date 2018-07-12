//
//  SignApi.swift
//  Weatherook
//
//  Created by 이영준 on 2018. 7. 12..
//  Copyright © 2018년 이영준. All rights reserved.
//

import Foundation
import Alamofire

class SignApi{
    
    func signin(user_id : String, user_pw:String) -> DataRequest{
        let param : [String : Any] = [
            "user_id" : user_id,
            "user_pw" : user_pw
        ]
        
        return Alamofire.request("\(BASE_URL)/auth/signin", method: .post, parameters: param, encoding: JSONEncoding.default, headers: headers)
    }
    
    func signup(user_id : String,
                user_pw: String,
                user_gender : String,
                user_age : Int,
                user_height : Int,
                user_weight : Int,
                user_stylelist : [String]) -> DataRequest {
        let param : [String : Any] = [
            "user_id" : user_id,
            "user_pw" : user_pw,
            "user_gender" : user_gender,
            "user_age" : user_age,
            "user_height" : user_height,
            "user_weight" : user_weight,
            "user_stylelist" : user_stylelist
        ]
        return Alamofire.request("\(BASE_URL)/auth", method: .post, parameters: param, encoding: JSONEncoding.default, headers: headers)
    }
}
