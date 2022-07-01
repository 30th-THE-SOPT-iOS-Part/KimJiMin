//
//  ViewController.swift
//  01
//
//  Created by 김지민 on 2022/04/02.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
//        messageLabel.text="도착한 메세지가 없어요"
        // Do any additional setup after loading the view.
    }

    @IBAction func newButtonDidTap(_ sender: Any) {
        messageLabel.text="새로운 메세지가 도착했어요~"
        messageLabel.textColor=UIColor.green
//        messageLabel.textColor=.green
        AudioServicesPlayAlertSound(SystemSoundID(1307))
    }
    
}
 
