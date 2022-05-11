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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNib()
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
      //섹션마다 몇 개의 행을 넣을 것인지
  }
    
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      //어떤 행을 어떻게 보여줄 것인지
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
                
        let okAction = UIAlertAction(title: "확인", style: .default, handler: { _ in })
                
        alert.addAction(okAction)
                
        self.present(alert, animated: true, completion: nil)
    }
}
