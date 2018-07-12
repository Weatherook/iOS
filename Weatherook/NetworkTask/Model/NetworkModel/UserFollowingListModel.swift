// To parse the JSON, add this file to your project and do:
//
//   let userFollowingListModel = try? JSONDecoder().decode(UserFollowingListModel.self, from: jsonData)

import Foundation

class UserFollowingListModel: Codable {
    let message: String?
    let data: DataClass8?
    
    init(message: String?, data: DataClass8?) {
        self.message = message
        self.data = data
    }
}

class DataClass8: Codable {
    let showFollowingIDResult: [ShowFollowingIDResult]?
    
    init(showFollowingIDResult: [ShowFollowingIDResult]?) {
        self.showFollowingIDResult = showFollowingIDResult
    }
}

class ShowFollowingIDResult: Codable {
    let userID, userImg, userDesc: String?
    
    enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case userImg = "user_img"
        case userDesc = "user_desc"
    }
    
    init(userID: String?, userImg: String?, userDesc: String?) {
        self.userID = userID
        self.userImg = userImg
        self.userDesc = userDesc
    }
}
