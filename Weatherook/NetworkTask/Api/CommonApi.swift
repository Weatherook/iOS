//
//  CommonApi.swift
//  Weatherook
//
//  Created by 이영준 on 2018. 7. 12..
//  Copyright © 2018년 이영준. All rights reserved.
//

import Foundation
import Alamofire
class CommonApi : CommonApiProtocol{
    
    // like 보내기
    func postLike(board_idx : Int) -> DataRequest{
        
        let param : [String : Any] = [
            "board_idx" : board_idx
        ]
        
        return Alamofire.request("\(BASE_URL)/board/like", method: .post, parameters: param, encoding: JSONEncoding.default, headers: headers)
    }
    // 내 팔로워 게시글 조회
    func getFollow() -> DataRequest{
        return Alamofire.request("\(BASE_URL)/board/follow", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers)
    }
    
    
    //
        
}
