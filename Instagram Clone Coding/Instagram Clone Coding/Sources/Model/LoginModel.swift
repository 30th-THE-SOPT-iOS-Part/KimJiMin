//
//  LoginModel.swift
//  Instagram Clone Coding
//
//  Created by 김지민 on 2022/05/15.
//

import Foundation

struct LoginResponse: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: LoginData?
}

struct LoginData: Codable {
    let email: String
    let name: String
}
