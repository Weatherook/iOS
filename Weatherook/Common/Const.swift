//
//  Const.swift
//  Weatherook
//
//  Created by 이영준 on 2018. 7. 9..
//  Copyright © 2018년 이영준. All rights reserved.
//

import Foundation

//let BASE_URL = "http://52.78.105.130:3004"
let BASE_URL = "https://weatherook.cf"
var headers = [
    "token" : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkeCI6MSwiaWF0IjoxNTMxMDYwNDU2LCJleHAiOjE1MzM2NTI0NTZ9.9m9x53Lx-t1GhfifnLo2AMu4GSfapBfYtV74QCwBimg",
    "Content_Type" : "application/x-www-form-urlencoded"
]

enum WeatherNumber : Int{
    case clean = 0
    case litteCloudy = 1
    case veryCloudy = 2
    case rainy = 3
    case rainyAndSnow = 4
    case snow = 5
}

enum DateType : Int{
    case yesterday = 1
    case today = 2
    case tomorrow = 3
}



//let headers = [
//    "token" : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkeCI6MSwiaWF0IjoxNTMxMDYwNDU2LCJleHAiOjE1MzM2NTI0NTZ9.9m9x53Lx-t1GhfifnLo2AMu4GSfapBfYtV74QCwBimg",
//    "Content_Type" : "application/x-www-form-urlencoded"
//]
//dd
