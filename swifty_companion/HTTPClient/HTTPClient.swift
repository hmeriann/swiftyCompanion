//
//  HTTPClient.swift
//  swifty_companion
//
//  Created by Zuleykha Pavlichenkova on 16.05.2023.
//  Copyright © 2023 Heidi Merianne. All rights reserved.
//

import Foundation

//typealias DataCompletion = (Result<Data, Error>) -> Void
enum HTTPClientError: Error {
    case wrongResponseType
    case wrongStatusCode
    case emptyData
}


protocol IHTTPClient {
    
//    func loadData(with request: URLRequest, completion: DataCompletion)
    func loadData(with request: URLRequest, completion: @escaping (Result<Data, Error>) -> Void)
}

class HTTPClient: IHTTPClient {
    
    func loadData(with request: URLRequest, completion: @escaping (Result<Data, Error>) -> Void) {
        
        
        let completionHandler: (Data?, URLResponse?, Error?) -> Void = { [weak self] data, response, error in
            guard let self = self else { return }
            self.handleResult(data: data, response: response, error: error, completion: completion)
        }
        
        let dataTask = URLSession.shared.dataTask(with: request, completionHandler: completionHandler)
        dataTask.resume()
    }
    
    func handleResult(
        data: Data?,
        response: URLResponse?,
        error: Error?,
        completion: (Result<Data, Error>) -> Void
    ) {
        if let error = error {
            completion(.failure(error))
        }
        guard let httpResponse = response as? HTTPURLResponse else {
            completion(.failure(HTTPClientError.wrongResponseType))
            return
        }
        guard 200..<300 ~= httpResponse.statusCode else {
            completion(.failure(HTTPClientError.wrongStatusCode))
            return
        }
        guard let data = data else {
            completion(.failure(HTTPClientError.emptyData))
            return
        }
        completion(.success(data))
    }
}
