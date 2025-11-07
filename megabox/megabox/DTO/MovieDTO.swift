//
//  MovieDTO.swift
//  megabox
//
//  Created by 정서영 on 11/4/25.
//

import SwiftUI

struct MovieDTO: Codable {
    let id: String
    let title: String
    let age_rating: String
    let schedules: [ScheduleDTO]
}

extension MovieDTO {
    func toDomain() -> MovieCard {
        let imageName: String
        switch id {
        case "m-001": imageName = "movie1"
        case "m-002": imageName = "movie2"
        case "m-003": imageName = "movie3"
        default: imageName = "defaultPoster"
        }
        
        return MovieCard(
            poster: Image(imageName),
            title: title,
            audience: "정보 없음",
            age: Int(age_rating) ?? 0
        )
    }
}
