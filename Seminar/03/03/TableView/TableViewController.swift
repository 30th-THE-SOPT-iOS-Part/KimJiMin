//
//  TableViewController.swift
//  03
//
//  Created by 김지민 on 2022/04/23.
//

import UIKit

class TableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib=UINib(nibName: MusicTableViewCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: MusicTableViewCell.identifier)
        
        tableView.delegate=self
        tableView.dataSource=self
    }
}

extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}

extension TableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MusicDataModel.sampleData.count
        //섹션마다 몇 개의 행을 넣을 것인지
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //어떤 행을 어떻게 보여줄 것인지
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MusicTableViewCell.identifier, for: indexPath) as? MusicTableViewCell else { return UITableViewCell()}
        
        cell.setData(MusicDataModel.sampleData[indexPath.row])
        
        return cell
    }
    
}
