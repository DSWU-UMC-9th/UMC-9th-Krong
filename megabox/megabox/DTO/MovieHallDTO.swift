//
//  MovieHallDTO.swift
//  megabox
//
//  Created by 정서영 on 11/4/25.
//

struct MovieHallDTO: Codable {
    let auditorium: String
    let format: String
    let showtimes: [ShowTimeDTO]
}

extension MovieHallDTO {
    func toDomain() -> MovieHallModel {
        return MovieHallModel(name: auditorium, format: format, schedule: showtimes.map { $0.toDomain() })
    }
}
