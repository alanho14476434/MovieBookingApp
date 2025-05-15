//
//  BookingView.swift
//  MOvieBookingApp
//
//  Created by Alan Ho on 13/5/2025.
//
import SwiftUI

struct BookingView: View {
    let movie: Movie
    @State private var selectedDate = Date()
    @State private var selectedTime = "12:00"
    @State private var showConfirmation = false

    let availableTimeslot = ["12:00", "15:00", "18:00", "21:00"]

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(movie.title)
                .font(.largeTitle)
                .bold()

            Text("Genre: \(movie.genre)")
                .font(.subheadline)

            Text("Duration: \(movie.duration) minutes")
                .font(.subheadline)

            Text(movie.description)
                .font(.body)

            Divider()

            Text("Select Date")
            DatePicker("Date", selection: $selectedDate, displayedComponents: .date)
                .datePickerStyle(.compact)
                .labelsHidden()

            Text("Select Time")
            Picker("Time", selection: $selectedTime) {
                ForEach(availableTimeslot, id: \.self) { time in
                    Text(time)
                }
            }
            .pickerStyle(.segmented)

            Spacer()

            Button(action: {
                print("Booked \(movie.title) on \(selectedDate) at \(selectedTime)")
                showConfirmation = true
            }) {
                Text("Confirm Booking")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }

            if showConfirmation {
                Text("Successfully booked \(movie.title) on \(formattedDate(selectedDate)) at \(selectedTime)!")
                    .foregroundColor(.green)
                    .padding(.top)
            }
        }
        .padding()
    }

    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: date)
    }
}
