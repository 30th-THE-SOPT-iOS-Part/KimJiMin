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
    
    static let unsplashBaseURL = "https://api.unsplash.com"
    static let feedImageURL = unsplashBaseURL + "/photos"
    
    // ???: API KEY 같이 gitignore로 관리해야 하는 것들은 보통 어떤 폴더의 어떤 이름의 파일에 정리해두나요? 😺
    static let clientID = "63gOlG9aUrjOLBAnAcqPRZ16eDwDdP_aGFm7Fw1oMQI"
}
