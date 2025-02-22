//
//  AppModel.swift
//  WeatherApp
//
//  Created by durodola on 29/06/2024.
//


import Foundation

struct Foods: Codable {
    let status, message: String?
    let data: [FoodDatum]?
}

// MARK: - Datum
struct FoodDatum: Codable {
    let id: Int?
    let name, description: String?
    let categoryID, calories: Int?
    let createdAt, updatedAt: String?
    let foodTags: [String]?
    let foodImages: [FoodImage]?
    let category: Category?

    enum CodingKeys: String, CodingKey {
        case id, name, description
        case categoryID = "category_id"
        case calories
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case foodTags, foodImages, category
    }
}

// MARK: - Category
struct Category: Codable {
    let id: Int?
    let name, description, createdAt, updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id, name, description
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

// MARK: - FoodImage
struct FoodImage: Codable {
    let id: Int?
    let imageURL: String?

    enum CodingKeys: String, CodingKey {
        case id
        case imageURL = "image_url"
    }
}
