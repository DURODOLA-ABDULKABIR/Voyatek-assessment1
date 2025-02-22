//
//  ViewModel.swift
//  WeatherApp
//
//  Created by durodola on 29/06/2024.
//

import Foundation

class FoodsNetwork {
    var delegate: FoodsProtocol?
    func fetchFoods() {
        NetworkService.shared.fetchFoods() { result in
            switch result {
            case .success(let response):
                if response.status != "success" {
                    self.delegate?.getFoodsError(errorMessage: response.message ?? "")
                } else {
                    self.delegate?.getFoodsSuccess(foods: response.data ?? [])
                }
            case .failure(let error):
                print(error)
                self.delegate?.noResponse()
            }
        }
    }
}
