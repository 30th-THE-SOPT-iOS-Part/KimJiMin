//
//  UIView+.swift
//  Codebase Practice
//
//  Created by 김지민 on 2022/07/05.
//
import UIKit

extension UIView {
    
    //    func addSubviews(_ views: [UIView]) {
    //        for view in views {
    //            self.addSubview(view)
    //        }
    //    }
    
    func addSubviews(_ views: [UIView]) {
        views.forEach { self.addSubview($0) }
    }
}
//
//#if canImport(SwiftUI) && DEBUG
//import SwiftUI
//extension UIView {
//    private struct Preview: UIViewRepresentable {
//        typealias UIViewType = UIView
//
//        let view: UIView
//
//        func makeUIView(context: Context) -> UIView {
//            return view
//        }
//
//        func updateUIView(_ uiView: UIView, context: Context) {
//        }
//    }
//
//    func showPreview() -> some View {
//        Preview(view: self).previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro"))
//    }
//}
//#endif
