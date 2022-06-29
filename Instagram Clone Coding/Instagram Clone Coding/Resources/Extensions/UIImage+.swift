//
//  UIImag+.swift
//  Instagram Clone Coding
//
//  Created by 김지민 on 2022/06/29.
//

import UIKit

extension UIImage {
    func resizeImage() -> UIImage {
        let width = UIScreen.main.bounds.width
        let scale = width / self.size.width
        let height = self.size.height * scale
        UIGraphicsBeginImageContext(CGSize(width: width, height: height))
        self.draw(in: CGRect(x: 0, y: 0, width: width, height: height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}
