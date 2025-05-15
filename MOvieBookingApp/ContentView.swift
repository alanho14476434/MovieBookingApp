//
//  ContentView.swift
//  MOvieBookingApp
//
//  Created by Alan Ho on 13/5/2025.
//
import SwiftUI

struct ContentView: View {
    private var moviesByGenre: [String: [Movie]] {
        Dictionary(grouping: sampleMovies, by: { $0.genre })
    }

    @State private var selectedMovie: Movie? = nil

    var body: some View {
        NavigationView {
            List {
                ForEach(moviesByGenre.sorted(by: { $0.key < $1.key }), id: \.key) { genre, movies in
                    Section(header: Text(genre).font(.headline)) {
                        ForEach(movies) { movie in
                            VStack(alignment: .leading) {
                                Text(movie.title)
                                    .font(.headline)
                                Text(movie.genre)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            .padding(5)
                            .onTapGesture {
                                selectedMovie = movie
                            }
                        }
                    }
                }
            }
            .listStyle(SidebarListStyle())
            .frame(minWidth: 200)

            if let movie = selectedMovie {
                BookingView(movie: movie)
            } else {
                VStack {
                    Text("Welcome to MovieBookingApp")
                        .font(.largeTitle)
                        .padding(.bottom, 8)

                    Text("Please select a movie from the list on the left to start booking.")
                        .font(.body)
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity)
            }
        }
    }
}
