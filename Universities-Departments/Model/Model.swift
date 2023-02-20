//
//  Model.swift
//  Universities-Departments
//
//  Created by İbrahim Bayram on 18.02.2023.
//

import Foundation

struct Province : Codable {
    let id: Int
    let province : String
    let universities : [University]
}
struct University : Codable {
    let name : String
    let phone : String
    let fax : String
    let website : String
    let email : String
    let adress : String
    let rector : String
}

