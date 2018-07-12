//
//  BoardApi.swift
//  Weatherook
//
//  Created by 이영준 on 2018. 7. 10..
//  Copyright © 2018년 이영준. All rights reserved.
//

import Foundation
import Alamofire

//dd
class BoardApi : BoardApiProtocol{
    //게시물 조회
    func getBoard(boardIdx : Int) -> DataRequest{
        Alamofire.request("\(BASE_URL)/board/\(boardIdx)", method: .get, headers: headers).responseJSON{
            print($0)
        }
        print("aaa")
        return Alamofire.request("\(BASE_URL)/board/\(boardIdx)", method: .get, headers: headers)
    }
    
    // 게시물 생성
    func postBoard(img : String, desc : String, x : Int, y : Int, auth : String, style : [String], weather: String, min : Int, max : Int) -> DataRequest{
        
        let param : [String : Any] = [
            "board_img" : img ,
            "board_desc" : desc,
            "x" : x,
            "y" : y,
            "board_auth" : auth,
            "board_stylelist" : style,
            "board_weather" : weather,
            "board_temp_min" : min,
            "board_temp_max" : max
        ]
        return Alamofire.request("\(BASE_URL)/board", method: .post, parameters: param, encoding: JSONEncoding.default, headers: headers)
    }
    // 오늘 날씨에 추천할만한 게시글 조회
    
    func boardCommend(x :Float, y: Float , date_type : DateType) -> DataRequest{
        let param : [String : Any] = [
            "x" : x,
            "y" : y,
            "date_type" : date_type.rawValue
        ]
        return Alamofire.request("\(BASE_URL)/board/commend", method: .post, parameters: param, encoding: JSONEncoding.default, headers: headers)
    }
    
    // 오늘의 인기 게시글 조회
    func boardTodayPopular() -> DataRequest{
        return Alamofire.request("\(BASE_URL)/board/today/popular", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers)
    }
    
    // 오늘 올라온 게시글 최신순조회
    func boardTodayLatest() -> DataRequest{
        return Alamofire.request("\(BASE_URL)/board/today/latest", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers)
    }
    
    // 전체 보드 필터링
    func allBoardFilter(gender : String, height : Int? , size : String?,temp : Int? , weather : WeatherNumber?, stylelist : [String]?) -> DataRequest{
        let param : [String : Any] = [
            "gender" : gender,
            "height" : height,
            "size" : size,
            "temp" : temp,
            "weather" : weather,
            "styleist" : stylelist
        ]
        return Alamofire.request("\(BASE_URL)/board/filter", method: .post, parameters: param, encoding: JSONEncoding.default, headers: headers)
    }
    
    func todayBoardFilter(gender : String, height : Int? , size : String?,temp : Int? , weather : WeatherNumber?, stylelist : [String]?) -> DataRequest{
        let param : [String : Any] = [
            "gender" : gender,
            "height" : height,
            "size" : size,
            "temp" : temp,
            "weather" : weather,
            "styleist" : stylelist
        ]
        return Alamofire.request("\(BASE_URL)/board/today/filter", method: .post, parameters: param, encoding: JSONEncoding.default, headers: headers)
    }
    
}


