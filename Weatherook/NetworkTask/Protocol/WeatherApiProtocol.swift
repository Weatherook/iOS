//
//  WeatherApiProtocol.swift
//  Weatherook
//
//  Created by 이영준 on 2018. 7. 13..
//  Copyright © 2018년 이영준. All rights reserved.
//

import Foundation
import Alamofire

protocol WeatherApiProtocol{
    func getWeather(x : Float, y : Float, date_type : DateType) -> DataRequest
    func getWeatherList(x : Float, y : Float) -> DataRequest
    func getWeatherComment(weather_temp : Int, weather_weather : WeatherNumber) -> DataRequest
}
