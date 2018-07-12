// To parse the JSON, add this file to your project and do:
//
//   let userBoard = try? JSONDecoder().decode(UserBoard.self, from: jsonData)
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseUserBoard { response in
//     if let userBoard = response.result.value {
//       ...
//     }
//   }

import Foundation
import Alamofire

class UserModel: Codable {
    let userDesc, userImg: String?
    let userWeight, userHeight: Int?
    let userGender, userID, userSalt, userPw: String?
    let userIdx, userAge: Int?
    let userStyle: [String]?
    
    enum CodingKeys: String, CodingKey {
        case userDesc = "user_desc"
        case userImg = "user_img"
        case userWeight = "user_weight"
        case userHeight = "user_height"
        case userGender = "user_gender"
        case userID = "user_id"
        case userSalt = "user_salt"
        case userPw = "user_pw"
        case userIdx = "user_idx"
        case userAge = "user_age"
        case userStyle = "user_style"
    }
    
    init(userDesc: String?, userImg: String?, userWeight: Int?, userHeight: Int?, userGender: String?, userID: String?, userSalt: String?, userPw: String?, userIdx: Int?, userAge: Int?, userStyle: [String]?) {
        self.userDesc = userDesc
        self.userImg = userImg
        self.userWeight = userWeight
        self.userHeight = userHeight
        self.userGender = userGender
        self.userID = userID
        self.userSalt = userSalt
        self.userPw = userPw
        self.userIdx = userIdx
        self.userAge = userAge
        self.userStyle = userStyle
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
    func responseUserBoard(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<UserModel>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
}
