//
//  LoginViewModel.swift
//  Weatherook
//
//  Created by 이영준 on 2018. 7. 5..
//  Copyright © 2018년 이영준. All rights reserved.
//

import Foundation

class LoginViewModel : LoginViewModeling{
    var api: SignApiProtocol
    init(api : SignApiProtocol) {
        self.api = api
    }
}
