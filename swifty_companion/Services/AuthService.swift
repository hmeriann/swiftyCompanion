//
//  AuthService.swift
//  swifty_companion
//
//  Created by Zuleykha Pavlichenkova on 20.05.2023.
//  Copyright © 2023 Heidi Merianne. All rights reserved.
//

// curl -X POST --data "grant_type=client_credentials&client_id=fd018336ae27ca0008145cf91632254239433a6646ee6441f1c1e28b48962c29&client_secret=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" https://api.intra.42.fr/oauth/token

import Foundation

protocol IAuthService {
    func loadAuthToken(completion: @escaping (Result<Token, Error>) -> Void)
}

final class AuthService: IAuthService {
    
    private let uID = "fd018336ae27ca0008145cf91632254239433a6646ee6441f1c1e28b48962c29"
    private let secret = "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"
    private let httpClient: IHTTPClient
    
    init(with httpClient: IHTTPClient) {
        self.httpClient = httpClient
    }
    
    func loadAuthToken(completion: @escaping (Result<Token, Error>) -> Void) {
        guard let url = URL(string: "https://api.intra.42.fr/oauth/token") else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("client_credentials", forHTTPHeaderField: "grant_type")
        urlRequest.setValue(uID, forHTTPHeaderField: "client_id")
//        urlRequest.setValue(secret, forHTTPHeaderField: <#T##String#>)
    }
    
    
    
}
