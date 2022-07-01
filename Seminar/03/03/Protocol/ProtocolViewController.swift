//
//  ProtocolViewController.swift
//  03
//
//  Created by 김지민 on 2022/04/23.
//

import UIKit

class ProtocolViewController:
    UIViewController,SecondViewControllerDelegate {
    
    func sendData(data: String) {
        dataLabel.text = data
    }
    
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
    }
    
    @IBAction func nextButtonDidTap(_ sender: Any) {
        guard let secondViewController =  self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else {
            return
            
        }
        secondViewController.delegate = self
        
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
}

extension ProtocolViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField){
        print("텍스트 필드의 편집이 시작되었습니다.")
    }
    
    func textFieldShouldReturn(_ textField: UITextField)->Bool{
        print("Return 버튼이 눌렸어요.")
        textField.endEditing(true)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField){
        print("텍스트 필드의 편집이 끝났습니다.")
    }
}
