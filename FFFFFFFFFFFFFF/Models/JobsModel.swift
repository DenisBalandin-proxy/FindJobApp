//
//  JobsModel.swift
//  FindJob
//
//  Created by Denis on 3/20/24.
//

import Foundation

struct Welcome: Decodable {
    let offers: [Offer]
    var vacancies: [Vacancy]
}

struct Offer: Decodable {
    let id: String?
    let title: String
    let link: String
    let button: ButtonJob?
}

struct ButtonJob: Decodable {
    let text: String
}

struct Vacancy: Decodable, Identifiable, Equatable {
    let id: String
    let lookingNumber: Int?
    let title: String
    let address: Address
    let company: String
    let experience: Experience
    let publishedDate: String
    var isFavorite: Bool
    let salary: Salary
    let schedules: [String]
    let appliedNumber: Int?
    let description: String?
    let responsibilities: String
    let questions: [String]
}

struct Address: Decodable, Equatable {
    let town, street, house: String
}

struct Experience: Decodable, Equatable {
    let previewText, text: String
}

struct Salary: Decodable, Equatable {
    let full: String
    let short: String?
}
