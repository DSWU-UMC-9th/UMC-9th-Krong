//
//  ScheduleDTO.swift
//  megabox
//
//  Created by 정서영 on 11/4/25.
//

import Foundation

struct ScheduleDTO: Codable {
    let date: String
    let areas: [AreaDTO]
}

extension ScheduleDTO {
    func toDomain() -> WeekDay {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        // 문자열 → Date 변환
        guard let parsedDate = formatter.date(from: date) else {
            // 변환 실패 시, 현재 날짜 등 기본값 지정
            return WeekDay(day: "", date: Date())
        }
        
        // 요일 계산 (월, 화, 수 ...)
        let weekdayFormatter = DateFormatter()
        weekdayFormatter.locale = Locale(identifier: "ko_KR")
        weekdayFormatter.dateFormat = "E"
        let weekdayString = weekdayFormatter.string(from: parsedDate)
        
        return WeekDay(day: weekdayString, date: parsedDate)
    }
}
