//
//  StoryCollectionViewCell.swift
//  Instagram Clone Coding
//
//  Created by 김지민 on 2022/05/01.
//

import UIKit

final class StoryCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    @IBOutlet weak var storyButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    
    //MARK: - View Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    //MARK: - Functions
    func setData(_ storyData: StoryDataModel){
        storyButton.setImage(storyData.profileImage, for: .normal)
        nameLabel.text=storyData.userName
        
    }
}
