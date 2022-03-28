//
//  UpdatePresenter.swift
//  NoodoeTest
//
//  Created by edisonlin on 2022/3/28.
//

import Foundation

protocol UpdatePresenterDelegate: AnyObject {
    func didUpdate()
}

class UpdatePresenter {
    
    weak var delegate: UpdatePresenterDelegate?
    var data: UpdateDataModel?
    
    func update(objectID: String, token: String) {

        let headers = ["X-Parse-Application-Id" : "vqYuKPOkLQLYHhk4QTGsGKFwATT4mBIGREI2m8eD",
                       "X-Parse-REST-API-Key" : "",
                       "X-Parse-Session-Token" : token,
                       "Content-Type" : "Application/json"]
        let parameters: Parameters = ["timezone" : 8]
        APIManager.shared.executeQuery(url: Constants.updateURL + "/" + objectID, method: .put, parameters: parameters, headers: headers) { (result: Result<UpdateDataModel, Error>) in
            switch result {
            case .success(let data):
                self.data = data
                self.delegate?.didUpdate()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    deinit {
        print(self, "deinit")
    }
}
