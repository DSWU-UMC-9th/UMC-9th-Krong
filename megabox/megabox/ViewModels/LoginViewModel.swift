//
//  LoginViewModel.swift
//  megabox
//
//  Created by 정서영 on 9/29/25.
//

import Foundation

@Observable
class LoginViewModel {
    var id: String = ""
    var pwd: String = ""
    
    init(id: String, pwd: String) {
        self.id = id
        self.pwd = pwd
    }
}
