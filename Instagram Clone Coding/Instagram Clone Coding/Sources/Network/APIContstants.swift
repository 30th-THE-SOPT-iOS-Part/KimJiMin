//
//  APITContstants.swift
//  Instagram Clone Coding
//
//  Created by 김지민 on 2022/05/15.
//

import Foundation

struct APIConstants {
    static let baseURL = "http://13.124.62.236"
    static let signInURL = baseURL + "/auth/signin"
    static let signUpURL = baseURL + "/auth/signup"
    
    //Lorem Picsum API 이용 시 
    static let picsumBaseURL = "https://picsum.photos"
    static let feedImageURL = picsumBaseURL + "/v2/list"

}
