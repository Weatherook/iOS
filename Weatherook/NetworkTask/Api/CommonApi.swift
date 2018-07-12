//
//  CommonApi.swift
//  Weatherook
//
//  Created by 이영준 on 2018. 7. 12..
//  Copyright © 2018년 이영준. All rights reserved.
//

import Foundation
import Alamofire
class CommonApi{
    
    // like 보내기
    func postLike(board_idx : Int) -> DataRequest{
        
        let param : [String : Any] = [
            "board_idx" : board_idx
        ]
        
        return Alamofire.request("\(BASE_URL)/board/like", method: .post, parameters: param, encoding: JSONEncoding.default, headers: headers)
    }
    
    
    //오늘 추천할만 게시글조회
    func retreiveCommend(x : Float, y : Float, date_type : DateType) -> DataRequest{
        let param : [String : Any] = [
            "x" : x ,
            "y" : y ,
            "date_type" : date_type.rawValue
        ]
        return Alamofire.request("\(BASE_URL)/board/commend", method: .post, parameters: param, encoding: JSONEncoding.default, headers: headers)
    }
    
        
}
