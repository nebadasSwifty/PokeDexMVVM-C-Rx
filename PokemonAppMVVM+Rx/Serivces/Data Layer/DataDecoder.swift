//
//  DataDecoder.swift
//  PokemonAppMVVM+Rx
//
//  Created by Кирилл on 06.06.2022.
//

import Foundation

protocol DataDecoderType {
    func JSONDecoder<T: Codable>(_ data: Data, completion: @escaping (T) -> Void)
}

class DataDecoder: DataDecoderType {
    func JSONDecoder<T: Codable>(_ data: Data, completion: @escaping (T) -> Void) {
        do {
            let decoder = Foundation.JSONDecoder()
            let decodedData = try decoder.decode(T.self, from: data)
            completion(decodedData)
        } catch {
            print(error)
        }
    }
}
