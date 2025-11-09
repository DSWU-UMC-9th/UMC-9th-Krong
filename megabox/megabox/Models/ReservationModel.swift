//
//  ReservationModel.swift
//  megabox
//
//  Created by 정서영 on 10/31/25.
//

import SwiftUI

struct TheaterModel: Identifiable {
    var id = UUID()
    var region: String
    var selected: Bool
    var MovieHalls: [MovieHallModel]
}

struct WeekDay: Identifiable {
    let id = UUID()
    let day: String
    let date: Date
}

struct MovieHallModel: Identifiable {
    let id = UUID()
    let name: String
    let format: String
    let schedule: [MovieSchedule]
}

struct MovieSchedule: Identifiable {
    let id = UUID()
    let startTime: String
    let endTime: String
    let remainingSeats: Int
    let totalSeats: Int
}
