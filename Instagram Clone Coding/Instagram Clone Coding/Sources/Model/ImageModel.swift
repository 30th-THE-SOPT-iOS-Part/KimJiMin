//
//  ImageModel.swift
//  Instagram Clone Coding
//
//  Created by 김지민 on 2022/05/15.
//

import Foundation

struct FeedImageResponse: Codable {
    let images:[Image]
}

struct Image : Codable{
//    let regular: String
    let urls:URLs?
    
//    let id : String
//    let created_at:String
//    let updated_at:String
//    let promoted_at: String?
//    let width:Int
//    let height:Int
//    let color:String
//    let blur_hash:String?
//    let description:String?
//    let alt_description:String?
    
}
struct URLs: Codable {
    let regular: String
}

