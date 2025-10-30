//
//  HomeModel.swift
//  megabox
//
//  Created by 정서영 on 10/5/25.
//

import SwiftUI

struct MovieCard: Identifiable {
    let id = UUID()
    let poster: Image
    let title: String
    let audience: String
    let age: Int
}

struct FunnyMovieCard: Identifiable {
    let id = UUID()
    let poster: Image
    let title: String
    let info: String
}

struct MovieDetail: Identifiable {
    let id = UUID()
    let image: Image
    let title: String
    let englishTitle: String
    let movieInfo: String
    let age: String
    let date: String
}
