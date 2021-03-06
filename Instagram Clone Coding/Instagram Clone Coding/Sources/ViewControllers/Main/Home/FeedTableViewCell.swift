//
//  FeedTableViewCell.swift
//  Instagram Clone Coding
//
//  Created by 김지민 on 2022/05/01.
//

import UIKit

protocol FeedTableViewCellDelegate : AnyObject{
    func likeButtonClicked(index: Int)
}


final class FeedTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    var index:Int = 0
    var delegate: FeedTableViewCellDelegate?
    
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
    
    //MARK: - View Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    //MARK: - Functions
    func setData(_ feedData: FeedDataModel){
        writerImageButton.setImage(feedData.writerImage, for: .normal)
        writerNameButton.setTitle(feedData.writerName, for: .normal)
        contentImage.load(feedData.url)
        likeInfoButton.setTitle(feedData.likeInfo, for: .normal)
        writerNameBelowButton.setTitle(feedData.writerName, for: .normal)
        contentSummaryButton.setTitle(feedData.contentSummary, for: .normal)
        commentExpanderButton.setTitle(feedData.commentInfo, for: .normal)
        
        heartButton.setImage(Const.Image.icn_unlike, for: .normal)
    }

    // MARK: - @IBAction Properties
    @IBAction func likeButtonClicked(_ sender: UIButton) {
        let newImage = sender.currentImage == Const.Image.icn_unlike ? "icn_like" : "icn_unlike"
        sender.setImage(UIImage(named: newImage), for: .normal)
        self.delegate?.likeButtonClicked(index:index)
    }
}
