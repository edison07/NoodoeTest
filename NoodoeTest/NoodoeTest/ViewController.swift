//
//  ViewController.swift
//  NoodoeTest
//
//  Created by edisonlin on 2022/3/28.
//

import UIKit

class ViewController: UIViewController {

    private let presenter = Presenter()
    
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

extension ViewController: PresenterDelegate {
    func didFetchData() {
        print(presenter.data)
    }
}

