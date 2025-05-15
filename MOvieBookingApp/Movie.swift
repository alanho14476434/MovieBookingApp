//
//  Movie.swift
//  MOvieBookingApp
//
//  Created by Alan Ho on 13/5/2025.
//

import Foundation
import Foundation
struct Movie: Identifiable{
    let id = UUID()
    let title: String
    let genre: String
    let duration: Int // in minutes
    let description: String
}
