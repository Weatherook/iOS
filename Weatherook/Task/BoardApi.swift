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
class BoardApi{
    func getBoard(boardIdx : Int) -> DataRequest{
        Alamofire.request("\(BASE_URL)/board/\(boardIdx)", method: .get, headers: headers).responseJSON{
            print($0)
        }
        print("aaa")
        return Alamofire.request("\(BASE_URL)/board/\(boardIdx)", method: .get, headers: headers)
    }
    
    func postBoard(img : String, desc : String, x : Int, y : Int, auth : String, style : [String], weather: String, min : Int, max : Int){
        
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
        Alamofire.request("\(BASE_URL)/board", method: .post, parameters: param, encoding: JSONEncoding.default, headers: headers).responseJSON{
            let _ = $0
        }
    }
}

