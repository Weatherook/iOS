//
//  CommentApi.swift
//  Weatherook
//
//  Created by 이영준 on 2018. 7. 12..
//  Copyright © 2018년 이영준. All rights reserved.
//

import Foundation
import Alamofire
class CommentApi {
    func postComment(board_idx : Int,desc : String) -> DataRequest{
        let param :[String : Any] = [
            "board_idx" : board_idx,
            "comment_desc" : desc
        ]
        return Alamofire.request("\(BASE_URL)/board/comment", method: .post, parameters: param, encoding: JSONEncoding.default, headers: headers)
        
    }
    
    func putComment(board_idx : Int, comment_desc : String, comment_idx :Int) ->DataRequest{
        
        let param : [String : Any] = [
            "board_idx" : board_idx,
            "comment_desc" : comment_desc,
            "comment_idx" : comment_idx
        ]
        
        return Alamofire.request("\(BASE_URL)/board/comment/\(board_idx)", method: .post, parameters: param, encoding: JSONEncoding.default, headers: headers)
    }
    
    func getComment(comment_idx : Int, board_idx : Int) -> DataRequest{
        let param : [String : Any] = [
            "comment_idx" : comment_idx,
            "board_idx" : board_idx
        ]
        return Alamofire.request("\(BASE_URL)/comment/\(board_idx)", method: .get, parameters: param, encoding: JSONEncoding.default, headers: headers)
    }
}
