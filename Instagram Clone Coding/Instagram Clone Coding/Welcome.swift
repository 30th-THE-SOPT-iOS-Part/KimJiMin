//
//  Welcome.swift
//  Instagram Clone Coding
//
//  Created by 김지민 on 2022/04/06.
//

import UIKit

class Welcome: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func gotoLoginClicked(_ sender: Any) {
        guard let presentingVC = self.presentingViewController as? UINavigationController else { return }
        self.view.window?.rootViewController?.dismiss(animated: false, completion:{
            presentingVC.popToRootViewController(animated: true)})
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
