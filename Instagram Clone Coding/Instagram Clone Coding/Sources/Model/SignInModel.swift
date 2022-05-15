//
//  LoginModel.swift
//  Instagram Clone Coding
//
//  Created by 김지민 on 2022/05/15.
//

import Foundation

struct SignInResponse: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: SignInData?
}

struct SignInData: Codable {
    let email: String
    let name: String
}
