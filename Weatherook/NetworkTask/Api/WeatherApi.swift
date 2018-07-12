//
//  WeatherApi.swift
//  Weatherook
//
//  Created by 이영준 on 2018. 7. 12..
//  Copyright © 2018년 이영준. All rights reserved.
//

import Foundation
import Alamofire

class WeatherApi{
    func getWeather(x : Float, y : Float, date_type : DateType) -> DataRequest{
        let param : [String : Any] = [
            "x" : x,
            "y" : y,
            "date_type" : date_type.rawValue
        ]
        return Alamofire.request("\(BASE_URL)/weather", method: .post, parameters: param, encoding: JSONEncoding.default, headers: headers)
    }
    
    func getWeatherList(x : Float, y : Float) -> DataRequest{
        let param : [String : Any] = [
            "x" : x,
            "y" : y
        ]
        return Alamofire.request("\(BASE_URL)/weather/list", method: .post, parameters: param, encoding: JSONEncoding.default, headers: headers)
    }
    
    // 감성글
    func getWeatherComment(weather_temp : Int, weather_weather : WeatherNumber) -> DataRequest{
        let param : [String : Any] = [
            "weater_temp" : weather_temp,
            "weater_weather" : weather_weather.rawValue
        ]
        return Alamofire.request("\(BASE_URL)/weather/comment", method: .post, parameters: param, encoding: JSONEncoding.default, headers: headers)
    }
    
//    // 세 시간 간격으로 6개 보여주기
//    func weather3hours(x : Float, y : Float) -> DataRequest{
//        let param : [String : Any] = [
//            "x" : x,
//            "y" : y
//        ]
//        return Alamofire.request("\(BASE_URL)/weather/list", method: .post, parameters: param, encoding: JSONEncoding.default, headers: headers)
//    }

}
