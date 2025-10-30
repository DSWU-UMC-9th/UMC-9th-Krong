//
//  ReservationViewModel.swift
//  megabox
//
//  Created by 정서영 on 10/30/25.
//

import SwiftUI

class ReservationViewModel: ObservableObject {
    @Published var selectedMovie: MovieCard
    
    init(movies: [MovieCard]) {
        self.selectedMovie = movies.first ?? MovieCard(poster: Image(.movie1), title: "", audience: "", age: 0)
    }
    
    func selectMovie(_ movie: MovieCard) {
        self.selectedMovie = movie
    }
}
