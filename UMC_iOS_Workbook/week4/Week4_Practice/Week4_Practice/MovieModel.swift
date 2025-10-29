//
//  MovieModel.swift
//  Week4_Practice
//
//  Created by 정서영 on 10/29/25.
//

import SwiftUI

struct MovieModel: Identifiable {
    let id: UUID = .init()
    let movieImage: Image
    let title: String
    let rate: Double
}
