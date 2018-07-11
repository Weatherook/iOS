// To parse the JSON, add this file to your project and do:
//
//   let styleModel = try? JSONDecoder().decode(StyleModel.self, from: jsonData)
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseStyleModel { response in
//     if let styleModel = response.result.value {
//       ...
//     }
//   }

import Foundation
import Alamofire

class UserStyleModel: Codable {
    let userIdx, styleIdx: Int?
    
    enum CodingKeys: String, CodingKey {
        case userIdx = "user_idx"
        case styleIdx = "style_idx"
    }
    
    init(userIdx: Int?, styleIdx: Int?) {
        self.userIdx = userIdx
        self.styleIdx = styleIdx
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
    func responseStyleModel(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<UserStyleModel>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
}
