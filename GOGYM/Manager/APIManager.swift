//
//  APIManager.swift
//  GoGym
//
//  Created by Aziz Bessrour on 2023-09-28.
//

import Foundation
import Combine

class APIManager {
    static let shared = APIManager()
    private let headers = [
        "X-RapidAPI-Key": APIKey,
        "X-RapidAPI-Host": "exercisedb.p.rapidapi.com"
    ]
    private let timeoutInterval = 10.0
    private let httpMethod = "GET"
    private let baseURL = "https://exercisedb.p.rapidapi.com/exercises"
    private let limitString = "?limit="

    private func buildRequest(path: URLPath, limit: Int? = nil) -> URLRequest {
        var stringURL = baseURL + path.rawValue
        if let limit {
            stringURL.append("\(limitString)\(limit)")
        }
        guard let url = URL(string: stringURL) else {
            fatalError("APIError.invalidEndpoint")
        }
        var request = URLRequest(
            url: url,
            cachePolicy: .returnCacheDataElseLoad, // .reloadIgnoringLocalCacheData
            timeoutInterval: timeoutInterval
        )
        
        /*: - Note: "Use this code in the feature to load cached data when internet is not available"
        // Load from the source
        if networkStatus == available {
            urlRequest.cachePolicy = .reloadIgnoringLocalCacheData
        }
        */
        request.httpMethod = httpMethod
        request.allHTTPHeaderFields = headers
        return request
    }
}

extension APIManager {
    func callAPI<T: Decodable>(_ path: URLPath, limit: Int? = nil) -> AnyPublisher<Response<T>, Error> {
        return URLSession.shared.dataTaskPublisher(for: buildRequest(path: path, limit: limit))
            .tryMap { result -> Response<T> in
                guard let httpResponse = result.response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    print("status code for api response : \((result.response as? HTTPURLResponse)?.statusCode ?? 200)")
                    throw URLError(.badURL)
                }
                
                let decoder = JSONDecoder()
                let value = try decoder.decode(T.self, from: result.data)
                return Response(value: value, response: result.response)
            }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}

struct Response<T> {
    let value: T
    let response: URLResponse
}
