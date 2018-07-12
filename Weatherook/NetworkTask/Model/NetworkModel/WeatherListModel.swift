// To parse the JSON, add this file to your project and do:
//
//   let weatherListModel = try? JSONDecoder().decode(WeatherListModel.self, from: jsonData)

import Foundation

class WeatherListModel: Codable {
    let message: String?
    let data: [Datum]?
    
    init(message: String?, data: [Datum]?) {
        self.message = message
        self.data = data
    }
}

class Datum: Codable {
    let hour: String?
    let weather, temp: Int?
    
    init(hour: String?, weather: Int?, temp: Int?) {
        self.hour = hour
        self.weather = weather
        self.temp = temp
    }
}
