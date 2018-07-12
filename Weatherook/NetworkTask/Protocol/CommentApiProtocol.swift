//
//  CommentApiProtocol.swift
//  Weatherook
//
//  Created by 이영준 on 2018. 7. 13..
//  Copyright © 2018년 이영준. All rights reserved.
//

import Foundation
import Alamofire

protocol CommentApiProtocol {
    func postComment(board_idx : Int,desc : String) -> DataRequest
    func putComment(board_idx : Int, comment_desc : String, comment_idx :Int) ->DataRequest
    func getComment(comment_idx : Int, board_idx : Int) -> DataRequest
}
