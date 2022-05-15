//
//  ImageModel.swift
//  Instagram Clone Coding
//
//  Created by 김지민 on 2022/05/15.
//

import Foundation

struct FeedImageResponse: Codable {
    let urls: URLs?
}

struct URLs: Codable {
    let regular: URL
}

