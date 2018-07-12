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

class UserBoard: Codable {
    let likeIdx, userIdx: Int?
    let likeDate: String?
    enum CodingKeys: String, CodingKey {
        case likeIdx = "like_idx"
        case userIdx = "user_idx"
        case likeDate = "like_date"
    }
    
    init(likeIdx: Int?, userIdx: Int?, likeDate: String?) {
        self.likeIdx = likeIdx
        self.userIdx = userIdx
        self.likeDate = likeDate
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
    func responseUserBoard(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<UserBoard>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
}
