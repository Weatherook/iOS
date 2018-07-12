//
//  BoardApiProtocol.swift
//  Weatherook
//
//  Created by 이영준 on 2018. 7. 13..
//  Copyright © 2018년 이영준. All rights reserved.
//

import Foundation
import Alamofire

protocol BoardApiProtocol {
    
    func getBoard(boardIdx : Int) -> DataRequest
    func boardCommend(x :Float, y: Float , date_type : DateType) -> DataRequest
    func boardTodayPopular() -> DataRequest
    func boardTodayLatest() -> DataRequest
    
    func postBoard(img : String,
                   desc : String,
                   x : Int,
                   y : Int,
                   auth : String,
                   style : [String],
                   weather: String,
                   min : Int,
                   max : Int) -> DataRequest
    
    func allBoardFilter(gender : String,
                        height : Int? ,
                        size : String?,
                        temp : Int? ,
                        weather : WeatherNumber?,
                        stylelist : [String]?) -> DataRequest
    
    func todayBoardFilter(gender : String,
                          height : Int? ,
                          size : String?,
                          temp : Int? ,
                          weather : WeatherNumber?,
                          stylelist : [String]?) -> DataRequest
}
