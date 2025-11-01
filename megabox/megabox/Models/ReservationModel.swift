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
}

struct WeekDay: Identifiable {
    let id = UUID()
    let day: String
    let date: Date
}
