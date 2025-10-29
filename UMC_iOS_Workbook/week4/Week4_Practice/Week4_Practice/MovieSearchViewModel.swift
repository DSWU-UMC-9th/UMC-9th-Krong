//
//  MovieSearchViewModel.swift
//  Week4_Practice
//
//  Created by 정서영 on 10/29/25.
//

import SwiftUI
import Combine

final class MovieSearchViewModel: ObservableObject {
    private let model: [MovieModel] = [
        .init(movieImage: .init(.image1), title: "미키", rate: 9.1),
        .init(movieImage: .init(.image2), title: "토이스토리", rate: 8.2),
        .init(movieImage: .init(.image3), title: "브루탈리스트", rate: 8.2),
        .init(movieImage: .init(.image4), title: "백설공주", rate: 8.2),
        .init(movieImage: .init(.image5), title: "위플래시", rate: 8.2),
        .init(movieImage: .init(.image6), title: "콘클라베", rate: 8.2),
        .init(movieImage: .init(.image7), title: "더폴", rate: 8.2)
    ]
    
    @Published var query: String = ""
    @Published var results: [MovieModel] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private var bag = Set<AnyCancellable>()
}
