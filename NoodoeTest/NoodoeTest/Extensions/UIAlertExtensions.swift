//
//  UIAlertExtensions.swift
//  NoodoeTest
//
//  Created by edisonlin on 2022/3/28.
//

import UIKit

extension UIViewController {

    func presentAlert(withTitle title: String, message : String?, completionHandler: (()-> ())?) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let OKAction = UIAlertAction(title: "OK", style: .default) { action in
        print("You've pressed OK Button")
        completionHandler?()
    }
    alertController.addAction(OKAction)
    self.present(alertController, animated: true, completion: nil)
  }
}
