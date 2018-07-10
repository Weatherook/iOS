//
//  BoardOtherApiProtocol.swift
//  Weatherook
//
//  Created by 이영준 on 2018. 7. 10..
//  Copyright © 2018년 이영준. All rights reserved.
//

import Foundation

protocol BoardOtherApiProtocol {
    func getCommend()
    func getToday()
    
    func postFollow()
    
    func postLike()
    func deleteLike()
    
    func postComment()
    func putComment()
    func deleteComment()
    func getCommentList()
}
