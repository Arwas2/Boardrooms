//
//  emploey.swift
//  Boardrooms
//
//  Created by ARWA ALSALEM on 27/08/1444 AH.
//

import Foundation
// MARK: - Employee
struct Employee: Codable {
    let id: Int
    let name, jobTitle, password: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case jobTitle = "job_title"
        case password
    }
}

//typealias Employees = [Employee]
