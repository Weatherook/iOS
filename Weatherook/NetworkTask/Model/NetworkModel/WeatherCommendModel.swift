// To parse the JSON, add this file to your project and do:
//
//   let weatherListModel = try? JSONDecoder().decode(WeatherListModel.self, from: jsonData)

import Foundation

class WeatherCommendModel: Codable {
    let message: String?
    let data: [Datum2]?
    
    init(message: String?, data: [Datum2]?) {
        self.message = message
        self.data = data
    }
}

class Datum2: Codable {
    let commendIdx: Int?
    let commendImg: String?
    let commendRef: String?
    
    enum CodingKeys: String, CodingKey {
        case commendIdx = "commend_idx"
        case commendImg = "commend_img"
        case commendRef = "commend_ref"
    }
    
    init(commendIdx: Int?, commendImg: String?, commendRef: String?) {
        self.commendIdx = commendIdx
        self.commendImg = commendImg
        self.commendRef = commendRef
    }
}
