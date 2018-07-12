// To parse the JSON, add this file to your project and do:
//
//   let userFollowerListModel = try? JSONDecoder().decode(UserFollowerListModel.self, from: jsonData)

import Foundation

class UserFollowerListModel: Codable {
    let message: String?
    let data: DataClass7?
    
    init(message: String?, data: DataClass7?) {
        self.message = message
        self.data = data
    }
}

class DataClass7: Codable {
    let showFollowerIDResult: [ShowFollowerIDResult]?
    
    init(showFollowerIDResult: [ShowFollowerIDResult]?) {
        self.showFollowerIDResult = showFollowerIDResult
    }
}

class ShowFollowerIDResult: Codable {
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
