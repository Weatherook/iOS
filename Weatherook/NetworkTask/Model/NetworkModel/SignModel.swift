// To parse the JSON, add this file to your project and do:
//
//   let userBoard = try? JSONDecoder().decode(UserBoard.self, from: jsonData)

import Foundation

class SignModel: Codable {
    let message, token: String?
    
    init(message: String?, token: String?) {
        self.message = message
        self.token = token
    }
}
