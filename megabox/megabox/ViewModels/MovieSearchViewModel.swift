//
//  MovieSearchViewModel.swift
//  megabox
//
//  Created by 정서영 on 11/3/25.
//

import SwiftUI
import Combine

class MovieSearchViewModel: ObservableObject {
    @Published var query: String = ""
    @Published var results: [MovieCard] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    private var bag = Set<AnyCancellable>()
    private var homeVM: HomeViewModel
    
    init(homeVM: HomeViewModel) {
        self.homeVM = homeVM
        self.results = homeVM.MovieCard
        
        $query
            .debounce(for: .milliseconds(400), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .handleEvents(receiveOutput: { [weak self] _ in
                self?.errorMessage = nil
            })
            .flatMap { query in
                self.search(query: query)
            }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                if case .failure(let err) = completion {
                    self?.errorMessage = "검색 실패: \(err.localizedDescription)"
                    self?.results = []
                }
            } receiveValue: { [weak self] items in
                self?.results = items
            }
            .store(in: &bag)
    }
    
    
    private func search(query: String) -> AnyPublisher<[MovieCard], Error> {
        return Future<[MovieCard], Error> { [weak self] promise in
            let delay = Double(Int.random(in: 300...700)) / 1000.0
            guard let self else { return }
            
            DispatchQueue.global().asyncAfter(deadline: .now() + delay) {
                let filtered: [MovieCard]
                if query.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    filtered = self.homeVM.MovieCard
                } else {
                    filtered = self.homeVM.MovieCard.filter { $0.title.lowercased().contains(query.lowercased()) }
                }
                promise(.success(filtered))
            }
        }
        .handleEvents(
            receiveSubscription: { _ in
                DispatchQueue.main.async {
                    self.isLoading = true
                }
            },
            receiveCompletion: { _ in
                DispatchQueue.main.async {
                    self.isLoading = false
                }
            }
        )
        .eraseToAnyPublisher()
    }
}
