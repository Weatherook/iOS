//
//  UserApiProtocol.swift
//  Weatherook
//
//  Created by 이영준 on 2018. 7. 13..
//  Copyright © 2018년 이영준. All rights reserved.
//

import Foundation
import Alamofire

protocol UserApiProtocol {
    func userNews() -> DataRequest
    func userFollow(follower_id : String) -> DataRequest
    func userShow(other_id : String?) -> DataRequest
    func userFollower() -> DataRequest
    func userFollowing() -> DataRequest
    func userSettings() -> DataRequest
}
