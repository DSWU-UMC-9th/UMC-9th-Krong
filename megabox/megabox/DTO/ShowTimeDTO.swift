//
//  ShowTimeDTO.swift
//  megabox
//
//  Created by 정서영 on 11/4/25.
//

struct ShowTimeDTO: Codable {
    let start: String
    let end: String
    let available: Int
    let total: Int
}

extension ShowTimeDTO {
    func toDomain() -> MovieSchedule {
        return MovieSchedule(startTime: start, endTime: end, remainingSeats: available, totalSeats: total)
    }
}
