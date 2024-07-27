//
//  APIRequestBuilder.swift
//  Essential
//
//  Created by KaayZenn on 09/03/2024.
//

import Foundation

public enum HTTPMethod: String {
    case GET
    case POST
    case PUT
    case DELETE
}

public protocol APIRequestBuilder {
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var parameters: [URLQueryItem]? { get }
    var headers: [(key: String, value: String)]? { get }
    var body: Data? { get }
    var urlRequest: URLRequest? { get }
}

extension APIRequestBuilder {
    
    var headers: [(key: String, value: String)]? {
        var header = [(String, String)]()
        header.append(("Content-Type", "application/json"))
        header.append(("User-Agent", "RobotPokemon"))
        header.append(("From", "Tyradex-Swift@gmail.com"))
        return header
    }
    
    var urlRequest: URLRequest? {
        let urlString = NetworkPath.baseURL + path
        
        var components = URLComponents(string: urlString)
        if let parameters {
            components?.queryItems = parameters
        }
        
        guard let url = components?.url else {
            return nil
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        if let headers {
            headers.forEach {
                request.addValue($0.value, forHTTPHeaderField: $0.key)
            }
        }
        
        if let body {
            request.httpBody = body
        }
        
        return request
    }
    
}
