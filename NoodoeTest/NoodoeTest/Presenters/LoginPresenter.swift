//
//  Presenter.swift
//  NoodoeTest
//
//  Created by edisonlin on 2022/3/28.
//

import Foundation

protocol LoginPresenterDelegate: AnyObject {
    func didFetchData()
}

class LoginPresenter {
    
    var data: LoginModel?
    weak var delegate: LoginPresenterDelegate?
    
    func login(username: String, password: String) {
        let parameters = ["username" : username, "password" : password]
        let headers = ["X-Parse-Application-Id" : "vqYuKPOkLQLYHhk4QTGsGKFwATT4mBIGREI2m8eD",
                       "X-Parse-REST-API-Key" : "",
                       "Content-Type" : "Application/json"]
        APIManager.shared.executeQuery(url: Constants.loginURL, method: .post, parameters: parameters, headers: headers) { (result: Result<LoginModel, Error>) in
            switch result {
            case .success(let data):
                self.data = data
                self.delegate?.didFetchData()
            case .failure(let error):
                print(error)
            }
        }
    }
}
