// To parse the JSON, add this file to your project and do:
//
//   let boardModel = try? JSONDecoder().decode(BoardModel.self, from: jsonData)
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseBoardModel { response in
//     if let boardModel = response.result.value {
//       ...
//     }
//   }

import Foundation
import Alamofire

class BoardModel: Codable {
    let message: String?
    let data: DataClass?
    
    init(message: String?, data: DataClass?) {
        self.message = message
        self.data = data
    }
}

class DataClass: Codable {
    let userImg, userID, boardImg, boardDesc: String?
    let likeCnt, boardTempMin, boardTempMax, boardWeather: Int?
    let boardDate: String?
    let commentList: [CommentList]?
    let commentCnt, flag: Int?
    
    enum CodingKeys: String, CodingKey {
        case userImg = "user_img"
        case userID = "user_id"
        case boardImg = "board_img"
        case boardDesc = "board_desc"
        case likeCnt = "like_cnt"
        case boardTempMin = "board_temp_min"
        case boardTempMax = "board_temp_max"
        case boardWeather = "board_weather"
        case boardDate = "board_date"
        case commentList = "comment_list"
        case commentCnt = "comment_cnt"
        case flag
    }
    
    init(userImg: String?, userID: String?, boardImg: String?, boardDesc: String?, likeCnt: Int?, boardTempMin: Int?, boardTempMax: Int?, boardWeather: Int?, boardDate: String?, commentList: [CommentList]?, commentCnt: Int?, flag: Int?) {
        self.userImg = userImg
        self.userID = userID
        self.boardImg = boardImg
        self.boardDesc = boardDesc
        self.likeCnt = likeCnt
        self.boardTempMin = boardTempMin
        self.boardTempMax = boardTempMax
        self.boardWeather = boardWeather
        self.boardDate = boardDate
        self.commentList = commentList
        self.commentCnt = commentCnt
        self.flag = flag
    }
}

class CommentList: Codable {
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

// MARK: - Alamofire response handlers

extension DataRequest {
    fileprivate func decodableResponseSerializer<T: Decodable>() -> DataResponseSerializer<T> {
        return DataResponseSerializer { _, response, data, error in
            guard error == nil else { return .failure(error!) }
            
            guard let data = data else {
                return .failure(AFError.responseSerializationFailed(reason: .inputDataNil))
            }
            
            return Result { try JSONDecoder().decode(T.self, from: data) }
        }
    }
    
    @discardableResult
    fileprivate func responseDecodable<T: Decodable>(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<T>) -> Void) -> Self {
        return response(queue: queue, responseSerializer: decodableResponseSerializer(), completionHandler: completionHandler)
    }
    
    @discardableResult
    func responseBoardModel(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<BoardModel>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
}
 
