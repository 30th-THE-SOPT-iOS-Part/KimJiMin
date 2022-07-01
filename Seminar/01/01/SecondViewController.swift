//
//  SecondViewController.swift
//  01
//
//  Created by 김지민 on 2022/04/02.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var dataLabel: UILabel!
    var message:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMessage()
    }
    
    @IBAction func backActionDidTap(_ sender: Any) {
//        self.dismiss(animated: true, completion: nil)
        //        어디로 갈 건지 알려주지 않아도 된다.
                self.navigationController?.popViewController(animated: true)
    }
    
    private func setMessage(){
        if let message = message {
            dataLabel.text = message
            dataLabel.sizeToFit()
        }
        
    }
}
