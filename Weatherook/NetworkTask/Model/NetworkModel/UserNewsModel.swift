// To parse the JSON, add this file to your project and do:
//
//   let followModel = try? JSONDecoder().decode(FollowModel.self, from: jsonData)

import Foundation

class UserNewsModel: Codable {
    let message: String?
    let data: [Datum5]?
    
    init(message: String?, data: [Datum5]?) {
        self.message = message
        self.data = data
    }
}

class Datum5: Codable {
    let flag: Int?
    let commentStr: CommentStr?
    let boardImg: String?
    let boardIdx, commentIdx: Int?
    let commentImg: String?
    let commentDesc: String?
    let commentID, date, dateModify, followStr: String?
    let follow, followImg: String?
    
    enum CodingKeys: String, CodingKey {
        case flag
        case commentStr = "comment_str"
        case boardImg = "board_img"
        case boardIdx = "board_idx"
        case commentIdx = "comment_idx"
        case commentImg = "comment_img"
        case commentDesc = "comment_desc"
        case commentID = "comment_id"
        case date
        case dateModify = "date_modify"
        case followStr = "follow_str"
        case follow
        case followImg = "follow_img"
    }
    
    init(flag: Int?, commentStr: CommentStr?, boardImg: String?, boardIdx: Int?, commentIdx: Int?, commentImg: String?, commentDesc: String?, commentID: String?, date: String?, dateModify: String?, followStr: String?, follow: String?, followImg: String?) {
        self.flag = flag
        self.commentStr = commentStr
        self.boardImg = boardImg
        self.boardIdx = boardIdx
        self.commentIdx = commentIdx
        self.commentImg = commentImg
        self.commentDesc = commentDesc
        self.commentID = commentID
        self.date = date
        self.dateModify = dateModify
        self.followStr = followStr
        self.follow = follow
        self.followImg = followImg
    }
}

enum CommentStr: String, Codable {
    case 님이댓글을남겼습니다 = "님이 댓글을 남겼습니다"
}
