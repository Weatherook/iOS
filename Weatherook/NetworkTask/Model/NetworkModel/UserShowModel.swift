// To parse the JSON, add this file to your project and do:
//
//   let userShowModel = try? JSONDecoder().decode(UserShowModel.self, from: jsonData)

import Foundation

class UserShowModel: Codable {
    let message: String?
    let showUserPageResult: [ShowUserPageResult]?
    let showBoardNumResult: [ShowBoardNumResult]?
    let showFollowerNumResult: [ShowFollowerNumResult]?
    let showFollowingNumResult: [ShowFollowingNumResult]?
    let data: [Datum6]?
    
    init(message: String?, showUserPageResult: [ShowUserPageResult]?, showBoardNumResult: [ShowBoardNumResult]?, showFollowerNumResult: [ShowFollowerNumResult]?, showFollowingNumResult: [ShowFollowingNumResult]?, data: [Datum6]?) {
        self.message = message
        self.showUserPageResult = showUserPageResult
        self.showBoardNumResult = showBoardNumResult
        self.showFollowerNumResult = showFollowerNumResult
        self.showFollowingNumResult = showFollowingNumResult
        self.data = data
    }
}

class Datum6: Codable {
    let userImg, userID: String?
    let boardIdx: Int?
    let boardImg, boardDesc: String?
    let likeCnt, likeFlag, boardTempMin, boardTempMax: Int?
    let boardWeather: Int?
    let boardDate: String?
    let commentList: [CommentList6]?
    let commentCnt, flag: Int?
    
    enum CodingKeys: String, CodingKey {
        case userImg = "user_img"
        case userID = "user_id"
        case boardIdx = "board_idx"
        case boardImg = "board_img"
        case boardDesc = "board_desc"
        case likeCnt = "like_cnt"
        case likeFlag = "like_flag"
        case boardTempMin = "board_temp_min"
        case boardTempMax = "board_temp_max"
        case boardWeather = "board_weather"
        case boardDate = "board_date"
        case commentList = "comment_list"
        case commentCnt = "comment_cnt"
        case flag
    }
    
    init(userImg: String?, userID: String?, boardIdx: Int?, boardImg: String?, boardDesc: String?, likeCnt: Int?, likeFlag: Int?, boardTempMin: Int?, boardTempMax: Int?, boardWeather: Int?, boardDate: String?, commentList: [CommentList6]?, commentCnt: Int?, flag: Int?) {
        self.userImg = userImg
        self.userID = userID
        self.boardIdx = boardIdx
        self.boardImg = boardImg
        self.boardDesc = boardDesc
        self.likeCnt = likeCnt
        self.likeFlag = likeFlag
        self.boardTempMin = boardTempMin
        self.boardTempMax = boardTempMax
        self.boardWeather = boardWeather
        self.boardDate = boardDate
        self.commentList = commentList
        self.commentCnt = commentCnt
        self.flag = flag
    }
}

class CommentList6: Codable {
    let commentIdx: Int?
    let commentDesc, commentDate, commentID: String?
    
    enum CodingKeys: String, CodingKey {
        case commentIdx = "comment_idx"
        case commentDesc = "comment_desc"
        case commentDate = "comment_date"
        case commentID = "comment_id"
    }
    
    init(commentIdx: Int?, commentDesc: String?, commentDate: String?, commentID: String?) {
        self.commentIdx = commentIdx
        self.commentDesc = commentDesc
        self.commentDate = commentDate
        self.commentID = commentID
    }
}

class ShowBoardNumResult: Codable {
    let boardNum: Int?
    
    enum CodingKeys: String, CodingKey {
        case boardNum = "board_num"
    }
    
    init(boardNum: Int?) {
        self.boardNum = boardNum
    }
}

class ShowFollowerNumResult: Codable {
    let follower: Int?
    
    init(follower: Int?) {
        self.follower = follower
    }
}

class ShowFollowingNumResult: Codable {
    let following: Int?
    
    init(following: Int?) {
        self.following = following
    }
}

class ShowUserPageResult: Codable {
    let userImg, userID, userDesc: String?
    
    enum CodingKeys: String, CodingKey {
        case userImg = "user_img"
        case userID = "user_id"
        case userDesc = "user_desc"
    }
    
    init(userImg: String?, userID: String?, userDesc: String?) {
        self.userImg = userImg
        self.userID = userID
        self.userDesc = userDesc
    }
}
