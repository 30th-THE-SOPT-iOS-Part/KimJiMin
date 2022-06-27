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

struct ImageModel : Codable{
//    let regular: String
//    let urls:URLs?
//    let id : String
//    let author: String
//    let width:Int
//    let height:Int
//    let url:String
    let download_url:String
    
    
//    let created_at:String
//    let updated_at:String
//    let promoted_at: String?
    
//    let color:String
//    let blur_hash:String?
//    let description:String?
//    let alt_description:String?
    
}
//struct URLs: Codable {
//    let regular: String
//}

