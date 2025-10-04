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
}

struct FunnyMovieCard: Identifiable {
    let id = UUID()
    let poster: Image
    let title: String
    let info: String
}
