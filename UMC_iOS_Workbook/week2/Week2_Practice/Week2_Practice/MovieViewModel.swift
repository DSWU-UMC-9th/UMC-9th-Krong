//
//  MovieViewModel.swift
//  Week2_Practice
//
//  Created by 정서영 on 9/28/25.
//

import SwiftUI

@Observable
class MovieViewModel {
    var currentIndex: Int = 0
    
    let movieModel: [MovieModel] = [
        .init(movieImage: .init(.image1), movieName: "미키", movieLike: 972, movieReserCount: 30.8),
        .init(movieImage: .init(.image2), movieName: "토이스토리", movieLike: 999, movieReserCount: 99.8),
        .init(movieImage: .init(.image3), movieName: "브루탈리스트", movieLike: 302, movieReserCount: 24.8),
        .init(movieImage: .init(.image4), movieName: "백설공주", movieLike: 302, movieReserCount: 3.8),
        .init(movieImage: .init(.image5), movieName: "위플래시", movieLike: 604, movieReserCount: 62.2),
        .init(movieImage: .init(.image6), movieName: "콘클라베", movieLike: 392, movieReserCount: 43.9),
        .init(movieImage: .init(.image7), movieName: "더폴", movieLike: 30, movieReserCount: 2.1)
    ]
    
    public func previousMovie() {
        currentIndex = (currentIndex - 1 + movieModel.count) % movieModel.count
    }
    
    public func nextMovie() {
        currentIndex = (currentIndex + 1) % movieModel.count
    }
}
