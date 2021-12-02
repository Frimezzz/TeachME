//
//  NetManager.swift
//  Weather1.0
//
//  Created by Guest on 25.11.21.
//

import Foundation

final class NetworManager<T: Codable> {
    
    static func fetch(fr url: URL, completion: @escaping(Result<T,NetworkError>) -> Void) {
//
        URLSession.shared.dataTask(with: url) { (data, responce, error) in
            guard error == nil else {
                print(String(describing: error!))
                completion(.failure(.error(err: error!.localizedDescription)))
                return
            }
            
            guard let httpResponce = responce as? HTTPURLResponse, httpResponce.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            do {
                
                
                
                let json = try JSONDecoder().decode(T.self, from: data )
                completion(.success(json))
            } catch let err {
                print(String(describing: err))
                completion(.failure(.decodingrror(err: err.localizedDescription)))
                           
            }
                           
        }.resume()
    }
                           
    }
                           

enum NetworkError: Error {
    case invalidResponse
    case invalidData
    case error(err: String)
    case decodingrror( err: String)
}

