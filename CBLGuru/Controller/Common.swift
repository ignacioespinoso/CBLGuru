//
//  Common.swift
//  CBLplanner
//
//  Created by Ignácio Espinoso Ribeiro on 25/04/19.
//  Copyright © 2019 Ignácio Espinoso Ribeiro. All rights reserved.
//
import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func updateNavigationBar(backRed: CGFloat, backGreen: CGFloat, backBlue: CGFloat, tintRed: CGFloat, tintGreen: CGFloat, tintBlue: CGFloat, title: String, largeTitle: Bool) {
        let nav = self.navigationController?.navigationBar
        nav?.tintColor = UIColor.white
        nav?.topItem?.title = title
        nav?.prefersLargeTitles = largeTitle
        nav?.backgroundColor = UIColor(red: backRed, green: backGreen, blue: backBlue, alpha:1.0)
        nav?.barTintColor = UIColor(red: tintRed, green: tintGreen, blue: tintBlue, alpha:1.0)
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        nav?.largeTitleTextAttributes = textAttributes
    }
}
