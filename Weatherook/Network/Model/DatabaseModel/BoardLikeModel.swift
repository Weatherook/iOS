// To parse the JSON, add this file to your project and do:
//
//   let boardLikeModel = try? JSONDecoder().decode(BoardLikeModel.self, from: jsonData)
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseBoardLikeModel { response in
//     if let boardLikeModel = response.result.value {
//       ...
//     }
//   }

import Foundation
import Alamofire

class BoardLikeModel: Codable {
    let boardIdx, likeIdx: Int
    
    enum CodingKeys: String, CodingKey {
        case boardIdx = "board_idx"
        case likeIdx = "like_idx"
    }
    
    init(boardIdx: Int, likeIdx: Int) {
        self.boardIdx = boardIdx
        self.likeIdx = likeIdx
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
    func responseBoardLikeModel(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<BoardLikeModel>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
}
