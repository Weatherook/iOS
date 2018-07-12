//
//  CommonApi.swift
//  Weatherook
//
//  Created by 이영준 on 2018. 7. 13..
//  Copyright © 2018년 이영준. All rights reserved.
//

import Foundation
import Alamofire

protocol CommonApiProtocol {
    func postLike(board_idx : Int) -> DataRequest
    func getFollow() -> DataRequest
}
