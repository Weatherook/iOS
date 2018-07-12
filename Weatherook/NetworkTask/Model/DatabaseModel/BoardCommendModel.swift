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

class BoardCommendModel: Codable {
    let commendIdx: Int?
    let commendImg, commendWeather: String?
    let commendTempMin, commendTempMax, commendCheck: Int?
    
    enum CodingKeys: String, CodingKey {
        case commendIdx = "commend_idx"
        case commendImg = "commend_img"
        case commendWeather = "commend_weather"
        case commendTempMin = "commend_temp_min"
        case commendTempMax = "commend_temp_max"
        case commendCheck = "commend_check"
    }
    
    init(commendIdx: Int?, commendImg: String?, commendWeather: String?, commendTempMin: Int?, commendTempMax: Int?, commendCheck: Int?) {
        self.commendIdx = commendIdx
        self.commendImg = commendImg
        self.commendWeather = commendWeather
        self.commendTempMin = commendTempMin
        self.commendTempMax = commendTempMax
        self.commendCheck = commendCheck
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
    func responseBoardStyleModel(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<BoardCommendModel>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
}
