//
//  ReservationViewModel.swift
//  megabox
//
//  Created by 정서영 on 10/30/25.
//

import SwiftUI
import Combine

class ReservationViewModel: ObservableObject {
    @Published var selectedMovie: MovieCard
    
    @Published var isTheaterSelectable: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    
    init(movies: [MovieCard]) {
        self.selectedMovie = movies.first ?? MovieCard(poster: Image(.movie1), title: "", audience: "", age: 0)
        
        $selectedMovie
            .map { !$0.title.isEmpty } 
            .assign(to: \.isTheaterSelectable, on: self)
            .store(in: &cancellables)
    }
    
    func selectMovie(_ movie: MovieCard) {
        self.selectedMovie = movie
    }
    
    @Published var TheaterList: [TheaterModel] = [
        .init(region: "강남", selected: false),
        .init(region: "홍대", selected: false),
        .init(region: "신촌", selected: false)
    ]
    
}
