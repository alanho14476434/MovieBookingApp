//
//  BookingViewModel.swift
//  MOvieBookingApp
//
//  Created by Alan Ho on 15/5/2025.
//

import SwiftUI

class BookingViewModel: ObservableObject {
    @Published var selectedDate: Date = Date()
    @Published var selectedTime: String = ""
    @Published var showConfirmation: Bool = false
    
    let availableTimeslot = ["10:00 AM", "1:00 PM", "4:00 PM", "7:00 PM"]
    
    func confirmBooking() {
        guard !selectedTime.isEmpty else {
            return
        }
        showConfirmation = true
    }
}
