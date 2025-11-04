//
//  ResponseDTO.swift
//  megabox
//
//  Created by 정서영 on 11/4/25.
//

import Foundation

struct APIResponseDTO: Codable {
    let status: String
    let message: String
    let data: Movie
}

struct Movie: Codable {
    let movies: [MovieDTO]
}
