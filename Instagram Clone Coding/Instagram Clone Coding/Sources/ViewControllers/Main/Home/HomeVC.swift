//
//  RedViewController.swift
//  Instagram Clone Coding
//
//  Created by 김지민 on 2022/04/16.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var storyCollectionView: UICollectionView!
    @IBOutlet weak var feedTableView: UITableView!
    var feedImageArray: [FeedImageResponse]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNib()
        fetchFeedImage()
    }
    
    private func registerNib(){
        let feedNib=UINib(nibName: FeedTableViewCell.identifier, bundle: nil)
        feedTableView.register(feedNib, forCellReuseIdentifier: FeedTableViewCell.identifier)
     
        let storyNib=UINib(nibName: StoryCollectionViewCell.identifier, bundle: nil)
        storyCollectionView.register(storyNib, forCellWithReuseIdentifier: StoryCollectionViewCell.identifier)
     
        feedTableView.dataSource=self
     
        storyCollectionView.delegate=self
        storyCollectionView.dataSource=self
    }
    
}

extension HomeVC: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return UITableView.automaticDimension
  }
}

extension HomeVC: UITableViewDataSource {
    
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return FeedDataModel.sampleData.count
  }
    
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: FeedTableViewCell.identifier, for: indexPath) as? FeedTableViewCell else { return UITableViewCell()}
    
    cell.setData(FeedDataModel.sampleData[indexPath.row])
    cell.index=indexPath.row
    cell.delegate=self
    
    return cell
  }
    
}

extension HomeVC : UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = UIScreen.main.bounds.width
    
    let cellWidth = width * (58/375)
    let cellHeight = cellWidth * (72/58)
    
    return CGSize(width: cellWidth, height: cellHeight)
  }
  
}

extension HomeVC : UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return StoryDataModel.sampleData.count
  }
    
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCollectionViewCell.identifier, for: indexPath) as?  StoryCollectionViewCell else {
      return UICollectionViewCell()
    }
      
      cell.setData(StoryDataModel.sampleData[indexPath.row])
    return cell
  }
}

extension HomeVC :FeedTableViewCellDelegate {
    func likeButtonClicked(index:Int) {
        let alert = UIAlertController(title: "하트", message: "\(index)번 글 하트 버튼 클릭", preferredStyle: .alert)
                
        let okAction = UIAlertAction(title: "확인", style: .default)
                
        alert.addAction(okAction)
                
        self.present(alert, animated: true, completion: nil)
    }
}

extension HomeVC {

    func fetchFeedImage() {
        
        FeedImageService.shared.fetchImage() { response in
            switch response {
            case .success(let data):
                guard let data = data as? FeedImageResponse else { return }
                print(data)
            case .requestErr(let err):
                print(err)
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
}
