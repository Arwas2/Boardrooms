//
//  Booking.swift
//  Boardrooms
//
//  Created by ARWA ALSALEM on 27/08/1444 AH.
//

import Foundation
// MARK: - BookingElement
struct Booking: Codable {
    let id: String
    let boardroom: Boardroom
  //  let date: String
}

// MARK: - Boardroom
struct Boardroom: Codable {
    let name: String
    let facilities: [String]
    let floorNo: Int
    let id, description: String
    let imageURL: String
    let noOfSeats: Int
   // let dateBooking: String

    enum CodingKeys: String, CodingKey {
        case name, facilities
        case floorNo = "floor_no"
        case id, description
        case imageURL = "image_url"
        case noOfSeats = "no_of_seats"
     //   case dateBooking = "date"
    }
}


typealias BookingElement = [Booking]
