//
//  Protocols.swift
//  WeatherApp
//
//  Created by durodola on 29/06/2024.
//

import Foundation

protocol FoodsProtocol: AnyObject {
    func getFoodsSuccess(foods: [FoodDatum])
    func getFoodsError(errorMessage: String)
    func noResponse()
}
