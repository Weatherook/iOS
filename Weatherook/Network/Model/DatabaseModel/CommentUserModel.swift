// To parse the JSON, add this file to your project and do:
//
//   let commentUserModel = try? JSONDecoder().decode(CommentUserModel.self, from: jsonData)
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseCommentUserModel { response in
//     if let commentUserModel = response.result.value {
//       ...
//     }
//   }

import Foundation
import Alamofire

class CommentUserModel: Codable {
    let commentIdx, userIdx: Int?
    
    enum CodingKeys: String, CodingKey {
        case commentIdx = "comment_idx"
        case userIdx = "user_idx"
    }
    
    init(commentIdx: Int?, userIdx: Int?) {
        self.commentIdx = commentIdx
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
    func responseCommentUserModel(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<CommentUserModel>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
}
