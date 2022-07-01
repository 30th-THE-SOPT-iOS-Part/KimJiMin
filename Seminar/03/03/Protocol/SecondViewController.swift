//
//  SecondViewController.swift
//  03
//
//  Created by 김지민 on 2022/04/23.
//

import UIKit

protocol SecondViewControllerDelegate{
    func sendData(data: String)
}//기능 명세서 작성. 함수 원형만

class SecondViewController: UIViewController {

    @IBOutlet weak var dataTextField: UITextField!
    
    var delegate:SecondViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func sendDataButtonDidTap(_ sender: Any) {
        if let text = dataTextField.text{
            delegate?.sendData(data: text)
        }
        self.navigationController?.popViewController(animated: true)
    }
    

}
