//
//  FeedTableViewModel.swift
//  Instagram Clone Coding
//
//  Created by 김지민 on 2022/05/01.
//

import UIKit

struct FeedDataModel {
    let writerName: String
    var writerImage: UIImage? {
        return UIImage(named:writerName)
    }
    var url:String
    let contentImageName:String
    var contentImage:UIImage? {
        return UIImage(named:contentImageName)
    }
    let likeNum:Int
    var likeInfo: String {
        return "좋아요 \(likeNum)개"
    }
    let contentSummary: String
    let commentNum:Int
    var commentInfo: String {
        return "댓글 \(commentNum)개 모두 보기"
    }

}

// MARK: - Extensions
extension FeedDataModel {
//    static var sampleData: [FeedDataModel] = [
//        FeedDataModel(writerName: "avatar6", url:"https://picsum.photos/700",contentImageName:"img_bg",likeNum: 9, contentSummary: "fffffff",commentNum:60),
//        FeedDataModel(writerName: "avatar1", url:"https://picsum.photos/500",contentImageName:"postImage1",likeNum: 3, contentSummary: "aaaaaaaaaa",commentNum:9),
//        FeedDataModel(writerName: "avatar2", url:"https://picsum.photos/500",contentImageName:"postImage2",likeNum:14, contentSummary: "bbbbbbbbbbbb",commentNum:3),
//        FeedDataModel(writerName: "avatar3", url:"https://picsum.photos/300",contentImageName:"postImage3",likeNum: 50, contentSummary: "ccccccccccc",commentNum:20),
//        FeedDataModel(writerName: "avatar4", url:"https://picsum.photos/600",contentImageName:"postImage4",likeNum: 150, contentSummary: "ddddd",commentNum:21),
//        FeedDataModel(writerName: "avatar5", url:"https://picsum.photos/400",contentImageName:"postImage1",likeNum: 22, contentSummary: "eeeeee",commentNum:5),
//        FeedDataModel(writerName: "avatar6", url:"https://picsum.photos/300",contentImageName:"postImage2",likeNum: 9, contentSummary: "fffffff",commentNum:60),
//    ]
    static var sampleData: [FeedDataModel] = [
        FeedDataModel(writerName: "avatar6", url:"",contentImageName:"img_bg",likeNum: 9, contentSummary: "fffffff",commentNum:60),
        FeedDataModel(writerName: "avatar1", url:"",contentImageName:"postImage1",likeNum: 3, contentSummary: "aaaaaaaaaa",commentNum:9),
        FeedDataModel(writerName: "avatar2", url:"",contentImageName:"postImage2",likeNum:14, contentSummary: "bbbbbbbbbbbb",commentNum:3),
        FeedDataModel(writerName: "avatar3", url:"",contentImageName:"postImage3",likeNum: 50, contentSummary: "ccccccccccc",commentNum:20),
        FeedDataModel(writerName: "avatar4", url:"",contentImageName:"postImage4",likeNum: 150, contentSummary: "ddddd",commentNum:21),
        FeedDataModel(writerName: "avatar5", url:"",contentImageName:"postImage1",likeNum: 22, contentSummary: "eeeeee",commentNum:5),
        FeedDataModel(writerName: "avatar6", url:"",contentImageName:"postImage2",likeNum: 9, contentSummary: "fffffff",commentNum:60),
    ]
}
