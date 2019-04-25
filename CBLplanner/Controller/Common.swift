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
}
