// To parse the JSON, add this file to your project and do:
//
//   let boardStyleModel = try? JSONDecoder().decode(BoardStyleModel.self, from: jsonData)
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseBoardStyleModel { response in
//     if let boardStyleModel = response.result.value {
//       ...
//     }
//   }

import Foundation
import Alamofire

class FollowModel: Codable {
    let followIdx: Int?
    let followDate: String?
    let userIdx: Int?
    
    enum CodingKeys: String, CodingKey {
        case followIdx = "follow_idx"
        case followDate = "follow_date"
        case userIdx = "user_idx"
    }
    
    init(followIdx: Int?, followDate: String?, userIdx: Int?) {
        self.followIdx = followIdx
        self.followDate = followDate
        self.userIdx = userIdx
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
    func responseBoardStyleModel(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<FollowModel>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
}
