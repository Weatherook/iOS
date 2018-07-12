//
//  UserApi.swift
//  Weatherook
//
//  Created by 이영준 on 2018. 7. 13..
//  Copyright © 2018년 이영준. All rights reserved.
//

import Foundation
import Alamofire

class UserApi : UserApiProtocol{
    
    // 유저 소식
    func userNews() -> DataRequest{
        return Alamofire.request("\(BASE_URL)/user/news", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers)
    }
    
    // 유저 팔로우하기
    func userFollow(follower_id : String) -> DataRequest{
        let param : [String : Any] = [
            "follower_id" : follower_id
        ]
        return Alamofire.request("\(BASE_URL)/user/follow", method: .post, parameters: param, encoding: JSONEncoding.default, headers: headers)
    }
    
    // 유저 보여주기
    func userShow(other_id : String?) -> DataRequest {
        if other_id == nil {
            return Alamofire.request("\(BASE_URL)/user/show", method: .post, parameters: nil, encoding: JSONEncoding.default, headers: headers)
        }else{
            let param : [String : Any] = [
                "other_id" : other_id!
            ]
            return Alamofire.request("\(BASE_URL)/user/show", method: .post, parameters: param, encoding: JSONEncoding.default, headers: headers)
        }
    }
    
    // 유저 팔로워 리스트
    func userFollower() -> DataRequest{
        return Alamofire.request("\(BASE_URL)/user/follower", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers)
    }
    
    func userFollowing() -> DataRequest{
        return Alamofire.request("\(BASE_URL)/user/following", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers)
    }
    
    func userSettings() -> DataRequest{
        return Alamofire.request("\(BASE_URL)/user/setting", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers)
    }
}
