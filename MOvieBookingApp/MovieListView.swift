//
//  MovieListView.swift
//  MOvieBookingApp
//
//  Created by Alan Ho on 13/5/2025.
//

import Foundation
import SwiftUI
struct MovieListView: View {
    var movies: [Movie]
    var body: some View{
        NavigationView{
            List(movies) { movie in
                NavigationLink(destination: BookingView(movie: movie)){
                    VStack(alignment: .leading) {
                        Text(movie.title)
                            .font(.headline)
                        Text(movie.genre)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("Movies")
        }
    }
}
#Preview {
    MovieListView(movies: sampleMovies)
}
