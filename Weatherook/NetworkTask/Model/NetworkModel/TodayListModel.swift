// To parse the JSON, add this file to your project and do:
//
//   let weatherListModel = try? JSONDecoder().decode(WeatherListModel.self, from: jsonData)

import Foundation

class TodayListModel: Codable {
    let message: String?
    let data: [Datum3]?
    
    init(message: String?, data: [Datum3]?) {
        self.message = message
        self.data = data
    }
}

class Datum3: Codable {
    let boardIdx: Int?
    let userImg, userID, boardImg, boardDesc: String?
    let likeCnt, likeFlag, boardTempMin, boardTempMax: Int?
    let boardWeather: Int?
    let boardDate: String?
    let commentList: [CommentList2]?
    let commentCnt, flag: Int?
    
    enum CodingKeys: String, CodingKey {
        case boardIdx = "board_idx"
        case userImg = "user_img"
        case userID = "user_id"
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
    
    init(boardIdx: Int?, userImg: String?, userID: String?, boardImg: String?, boardDesc: String?, likeCnt: Int?, likeFlag: Int?, boardTempMin: Int?, boardTempMax: Int?, boardWeather: Int?, boardDate: String?, commentList: [CommentList2]?, commentCnt: Int?, flag: Int?) {
        self.boardIdx = boardIdx
        self.userImg = userImg
        self.userID = userID
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

class CommentList2: Codable {
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
