//
//  NetworkError.swift
//  WeatherApp
//
//  Created by durodola on 29/06/2024.
//

import Foundation

enum NetworkingError: LocalizedError {
    case errorDecoding
    case unknownError
    case invalidUrl
    case serverError(String)
    
    var errorDescription: String? {
        switch self {
        case .errorDecoding:
            return "Response could not be decoded"
        case .unknownError:
            return "Unknown error"
        case .invalidUrl:
            return "Please provide a valid URL"
        case .serverError(let error):
            return error
        }
    }
}
