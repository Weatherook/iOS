//
//  URLRequest+setDefaultHeader.swift
//  Weatherook
//
//  Created by 이영준 on 2018. 7. 11..
//  Copyright © 2018년 이영준. All rights reserved.
//

import Foundation

extension URLRequest{
    mutating func setDefaultHeader(json : Data, method: String) -> URLRequest{
        setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
    setValue("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkeCI6MSwiaWF0IjoxNTMxMDYwNDU2LCJleHAiOjE1MzM2NTI0NTZ9.9m9x53Lx-t1GhfifnLo2AMu4GSfapBfYtV74QCwBimg", forHTTPHeaderField: "token")
        httpBody = json
        httpMethod = method
        
        return self
    }
}
