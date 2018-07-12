// To parse the JSON, add this file to your project and do:
//
//   let weatherModel = try? JSONDecoder().decode(WeatherModel.self, from: jsonData)
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseWeatherModel { response in
//     if let weatherModel = response.result.value {
//       ...
//     }
//   }

import Foundation
import Alamofire

class WeatherShowModel: Codable {
    let weatherIdx: Int?
    let weatherTextTemp, weatherTextWeather: String?
    let weatherTempMin, weatehrTempMax: Int?
    let weatherWeather: String?
    
    enum CodingKeys: String, CodingKey {
        case weatherIdx = "weather_idx"
        case weatherTextTemp = "weather_text_temp"
        case weatherTextWeather = "weather_text_weather"
        case weatherTempMin = "weather_temp_min"
        case weatehrTempMax = "weatehr_temp_max"
        case weatherWeather = "weather_weather"
    }
    
    init(weatherIdx: Int?, weatherTextTemp: String?, weatherTextWeather: String?, weatherTempMin: Int?, weatehrTempMax: Int?, weatherWeather: String?) {
        self.weatherIdx = weatherIdx
        self.weatherTextTemp = weatherTextTemp
        self.weatherTextWeather = weatherTextWeather
        self.weatherTempMin = weatherTempMin
        self.weatehrTempMax = weatehrTempMax
        self.weatherWeather = weatherWeather
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
    func responseWeatherModel(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<WeatherShowModel>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
}
