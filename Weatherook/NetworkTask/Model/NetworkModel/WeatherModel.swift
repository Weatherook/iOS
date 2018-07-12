// To parse the JSON, add this file to your project and do:
//
//   let weatherModel = try? JSONDecoder().decode(WeatherModel.self, from: jsonData)

import Foundation

class WeatherModel: Codable {
    let message: String?
    let data: DataClass2?
    
    init(message: String?, data: DataClass2?) {
        self.message = message
        self.data = data
    }
}

class DataClass2: Codable {
    let dateType, currentWeather, currentTemp, currentPop: Int?
    let currentReh, tempAF, tempAm: Int?
    let weatherAF, weatherAm: String?
    
    enum CodingKeys: String, CodingKey {
        case dateType = "date_type"
        case currentWeather = "current_weather"
        case currentTemp = "current_temp"
        case currentPop = "current_pop"
        case currentReh = "current_reh"
        case tempAF = "temp_af"
        case tempAm = "temp_am"
        case weatherAF = "weather_af"
        case weatherAm = "weather_am"
    }
    
    init(dateType: Int?, currentWeather: Int?, currentTemp: Int?, currentPop: Int?, currentReh: Int?, tempAF: Int?, tempAm: Int?, weatherAF: String?, weatherAm: String?) {
        self.dateType = dateType
        self.currentWeather = currentWeather
        self.currentTemp = currentTemp
        self.currentPop = currentPop
        self.currentReh = currentReh
        self.tempAF = tempAF
        self.tempAm = tempAm
        self.weatherAF = weatherAF
        self.weatherAm = weatherAm
    }
}
