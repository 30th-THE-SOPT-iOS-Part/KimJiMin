//
//  FeedTableViewCell.swift
//  Instagram Clone Coding
//
//  Created by 김지민 on 2022/05/01.
//

import UIKit

protocol FeedTableViewCellDelegate : AnyObject{//범용성 위해서 일단 AnyObject로.
    func likeButtonClicked(index: Int)
}


final class FeedTableViewCell: UITableViewCell {
    
    var index:Int = 0
    var delegate : FeedTableViewCellDelegate?
    //FeedTableViewCellDelegate 형의 delegate 프로퍼티 생성.
    
    @IBOutlet weak var writerImageButton: UIButton!
    @IBOutlet weak var writerNameButton: UIButton!
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var contentImage: UIImageView!
    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var likeInfoButton: UIButton!
    @IBOutlet weak var writerNameBelowButton: UIButton!
    @IBOutlet weak var contentSummaryButton: UIButton!
    @IBOutlet weak var commentExpanderButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setData(_ feedData: FeedDataModel){
        writerImageButton.setImage(feedData.writerImage, for: .normal)
        writerNameButton.setTitle(feedData.writerName, for: .normal)
        contentImage.image=feedData.contentImage
        likeInfoButton.setTitle(feedData.likeInfo, for: .normal)
        writerNameBelowButton.setTitle(feedData.writerName, for: .normal)
        contentSummaryButton.setTitle(feedData.contentSummary, for: .normal)
        commentExpanderButton.setTitle(feedData.commentInfo, for: .normal)
        
        heartButton.setImage(UIImage(named: "icn_unlike"), for: .normal)
    }

    @IBAction func likeButtonClicked(_ sender: UIButton) {
        print(sender.currentImage ?? "nothing")
        let newImage = sender.currentImage == UIImage(named: "icn_unlike") ? "icn_like" : "icn_unlike"
        print(newImage)
        sender.setImage(UIImage(named: newImage), for: .normal)
        self.delegate?.likeButtonClicked(index:index)
    }
}
