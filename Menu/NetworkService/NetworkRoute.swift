//
//  NetworkRoute.swift
//  WeatherApp
//
//  Created by durodola on 29/06/2024.
//

import Foundation
enum Route {
    
    static let baseUrl = "https://assessment.vgtechdemo.com/"
    
    case fetchFoods
    
    var description: String {
        switch self {
        case .fetchFoods:
            return "api/foods"
        }
    }
}
