//
//  APIManager.swift
//  NoodoeTest
//
//  Created by edisonlin on 2022/3/28.
//

import Foundation

class APIManager {
    
    static let shared = APIManager()
    
    func executeQuery<T>(url:String, completion: @escaping (Result<T, Error>) -> Void) where T: Codable {
        guard let url = URL(string: url) else { return }
        DispatchQueue.global().async {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                }
                guard let data = data else {
                    return
                }
                
                do {
                    let data = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(data))
                } catch let error{
                    completion(.failure(error))
                }
            }.resume()
        }
    }
    
    private init() {}
}
