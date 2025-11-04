//
//  AreaDTO.swift
//  megabox
//
//  Created by 정서영 on 11/4/25.
//

struct AreaDTO: Codable {
    let area: String
    let items: [MovieHallDTO]
}

extension AreaDTO {
    func toDomain() -> TheaterModel {
        return TheaterModel(region: area, selected: false, MovieHalls: items.map { $0.toDomain() })
    }
}
