//
//  APIManager.swift
//  NoodoeTest
//
//  Created by edisonlin on 2022/3/28.
//

import Foundation

class APIManager {
    
    static let shared = APIManager()
    
    func executeQuery<T>(url:String, method: HTTPMethod, parameters: Parameters?, headers: HttpHeaders?, completion: @escaping (Result<T, Error>) -> Void) where T: Codable {
        
        guard let url = URL(string: url) else { return }
        var request = URLRequest(url: url, method: method, headers: headers)
        
        if let parameters = parameters {
            let jsonData = try? JSONSerialization.data(withJSONObject: parameters)
            request.httpBody = jsonData
        }
        DispatchQueue.global().async {
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                }
                guard let data = data else {
                    return
                }
                DispatchQueue.main.async {
                    
                    do {
                        let data = try JSONDecoder().decode(T.self, from: data)
                        completion(.success(data))
                    } catch let error{
                        completion(.failure(error))
                    }
                }
            }.resume()
        }
    }
    
    private init() {}
}

enum HTTPMethod: String {
    case get
    case post
    case put
    case delete
}

extension URLRequest {
    init(url: URL, method: HTTPMethod, headers: [String: String]? = nil)  {
        self.init(url: url)
        httpMethod = method.rawValue
        if let headers = headers {
            for (headerField, headerValue) in headers {
                setValue(headerValue, forHTTPHeaderField: headerField)
            }
        }
    }
}

public typealias Parameters = [String: Any]
public typealias HttpHeaders = [String: String]

