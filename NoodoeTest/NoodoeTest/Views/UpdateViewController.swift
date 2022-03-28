//
//  SecondViewController.swift
//  NoodoeTest
//
//  Created by edisonlin on 2022/3/28.
//

import UIKit

class UpdateViewController: UIViewController {

    var data: LoginModel?
    private let presenter = UpdatePresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.delegate = self
    }
    
    @IBAction func updateButtonPressed(_ sender: UIButton) {
        guard let objectID = data?.objectID, let sessionToken = data?.sessionToken else {
            return
        }

        presenter.update(objectID: objectID, token: sessionToken)
    }
    
    deinit {
        print(self, "deinit")
    }
}

extension UpdateViewController: UpdatePresenterDelegate {
    func didUpdate() {
        presentAlert(withTitle: "更新成功", message: presenter.data?.updatedAt, completionHandler: nil)
    }
}
