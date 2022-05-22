//
//  StoryCollectionViewCell.swift
//  Instagram Clone Coding
//
//  Created by 김지민 on 2022/05/01.
//

import UIKit

final class StoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var storyButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setData(_ storyData: StoryDataModel){
        storyButton.setImage(storyData.profileImage, for: .normal)
        nameLabel.text=storyData.userName
        
    }
}
