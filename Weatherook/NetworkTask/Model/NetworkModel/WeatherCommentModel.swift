// To parse the JSON, add this file to your project and do:
//
//   let weatherListModel = try? JSONDecoder().decode(WeatherListModel.self, from: jsonData)

import Foundation

class WeatherCommentModel: Codable {
    let message: String?
    let data: DataClass3?
    
    init(message: String?, data: DataClass3?) {
        self.message = message
        self.data = data
    }
}

class DataClass3: Codable {
    let weatherTextTemp, weatherTextWeather: String?
    
    enum CodingKeys: String, CodingKey {
        case weatherTextTemp = "weather_text_temp"
        case weatherTextWeather = "weather_text_weather"
    }
    
    init(weatherTextTemp: String?, weatherTextWeather: String?) {
        self.weatherTextTemp = weatherTextTemp
        self.weatherTextWeather = weatherTextWeather
    }
}
