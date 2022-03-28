//
//  ViewController.swift
//  NoodoeTest
//
//  Created by edisonlin on 2022/3/28.
//

import UIKit

class LoginViewController: UIViewController {

    private let presenter = LoginPresenter()
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.delegate = self
    }
    
    @IBAction func usernameTextFieldEditingChanged(_ sender: UITextField) {
        checkIfCanLogin()
    }
    @IBAction func passwordTextFieldEditingChanged(_ sender: UITextField) {
        checkIfCanLogin()
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        guard let username = usernameTextField.text , let password = passwordTextField.text else { return }
        presenter.login(username: username, password: password)
    }
    
    private func checkIfCanLogin() {
        loginButton.isEnabled = usernameTextField.text != nil && usernameTextField.text != "" && passwordTextField.text != nil && passwordTextField.text != ""
    }
}

extension LoginViewController: LoginPresenterDelegate {
    func didFetchData() {
        if let error = presenter.data?.error {
            presentAlert(withTitle: "登入失敗", message: error, completionHandler: nil)
        } else {
            presentAlert(withTitle: "登入成功", message: nil) {
                let vc = UpdateViewController.viewController(from: .main)
                vc.data = self.presenter.data
                self.show(vc, sender: nil)
            }
        }
    }
}

