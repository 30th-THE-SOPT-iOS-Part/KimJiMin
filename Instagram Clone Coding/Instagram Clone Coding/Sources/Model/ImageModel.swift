//
//  ImageModel.swift
//  Instagram Clone Coding
//
//  Created by 김지민 on 2022/05/15.
//

import Foundation

struct FeedImageResponse: Codable {
    let images:[ImageModel]
}

//Lorem Picsum API 이용 시
struct ImageModel : Codable{
    let download_url:String
}

//struct ImageModel : Codable{
//    let urls:URLs?
    
//}
//struct URLs: Codable {
//    let regular: String
//}

