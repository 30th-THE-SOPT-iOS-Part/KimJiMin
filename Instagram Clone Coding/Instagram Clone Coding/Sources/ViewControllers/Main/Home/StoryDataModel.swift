//
//  StoryDataModel.swift
//  Instagram Clone Coding
//
//  Created by 김지민 on 2022/05/01.
//

import UIKit

struct StoryDataModel {
    let userName: String
    var profileImage:UIImage? {
        return UIImage(named:userName)
    }
}

extension StoryDataModel {
  static let sampleData: [StoryDataModel] = [
    StoryDataModel(userName: "avatar1"),
    StoryDataModel(userName: "avatar2"),
    StoryDataModel(userName: "avatar3"),
    StoryDataModel(userName: "avatar4"),
    StoryDataModel(userName: "avatar5"),
    StoryDataModel(userName: "avatar6"),
    StoryDataModel(userName: "avatar1"),
    StoryDataModel(userName: "avatar2"),
    StoryDataModel(userName: "avatar3"),
    StoryDataModel(userName: "avatar4"),
    StoryDataModel(userName: "avatar5"),
    StoryDataModel(userName: "avatar6")
  ]
}
