//
//  NetworkService.swift
//  Essential
//
//  Created by KaayZenn on 09/03/2024.
//

import Foundation

// Protocole
public protocol NetworkServiceProtocol {
    func sendRequest<T: Decodable>(apiBuilder: APIRequestBuilder, responseModel: T.Type) async throws -> T
    func fetchStream<T: Decodable>(apiBuilder: APIRequestBuilder, responseModel: T.Type) -> AsyncThrowingStream<T, Error>
}

// Implémentation du service de réseau
public class NetworkService: NetworkServiceProtocol {
    static let shared = NetworkService()
}

extension NetworkService {
    
    public func sendRequest<T: Decodable>(apiBuilder: APIRequestBuilder, responseModel: T.Type) async throws -> T {
        do {
            guard let urlRequest = apiBuilder.urlRequest else {
                throw NetworkError.badRequest
            }
            
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            guard let dataToDecode = try mapResponse(response: (data, response, urlRequest.httpMethod)) else {
                throw NetworkError.parsingError
            }
                        
            return try decodeResponse(dataToDecode: dataToDecode, responseModel: responseModel)
        } catch let error as NetworkError {
            throw error
        }
    }
    
    private func decodeResponse<T: Decodable>(dataToDecode: Data, responseModel: T.Type) throws -> T {
        do {
            let results = try JSONDecoder().decode(responseModel, from: dataToDecode)
            return results
        } catch {
            print("⚠️ PARSING ERROR : \(error.localizedDescription)")
            throw NetworkError.parsingError
        }
    }
    
    public func fetchStream<T: Decodable>(apiBuilder: APIRequestBuilder, responseModel: T.Type) -> AsyncThrowingStream<T, Error> {
        return AsyncThrowingStream { continuation in
            Task {
                do {
                    let results = try await sendRequest(apiBuilder: apiBuilder, responseModel: [T].self)
                    for item in results {
                        continuation.yield(item)
                    }
                    continuation.finish()
                } catch {
                    continuation.finish(throwing: error)
                }
            }
        }
    }
    
}
