//
//  ReservationViewModel.swift
//  megabox
//
//  Created by 정서영 on 10/30/25.
//

import SwiftUI
import Combine

class ReservationViewModel: ObservableObject {
    @Published var selectedMovie: MovieCard
    @Published var isTheaterSelectable: Bool = false
    @Published var isDateSelectable: Bool = false
    @Published var isTimeSelectable: Bool = false
    private var cancellables = Set<AnyCancellable>()
    
    @Published var TheaterList: [TheaterModel] = []
    @Published var regions: [TheaterModel] = []
    
    var selectedRegions: [TheaterModel] {
        TheaterList.filter { $0.selected }
    }

    init(movies: [MovieCard], currentWeek: Date = Date(), selectedDate: Date = Date(), calendar: Calendar = Calendar.current) {
        self.selectedMovie = movies.first ?? MovieCard(poster: Image(.movie1), title: "", audience: "", age: 0)
        self.currentWeek = currentWeek
        self.selectedDate = selectedDate
        self.calendar = calendar
        self.TheaterList = [
                    TheaterModel(
                        region: "강남",
                        selected: false,
                        MovieHalls: [
                            MovieHallModel(
                                name: "크리플라이나 1관",
                                format: "2D",
                                schedule: [
                                    MovieSchedule(startTime: "11:30", endTime: "13:58", remainingSeats: 109, totalSeats: 116),
                                    MovieSchedule(startTime: "14:20", endTime: "16:48", remainingSeats: 109, totalSeats: 116),
                                    MovieSchedule(startTime: "17:05", endTime: "19:28", remainingSeats: 101, totalSeats: 116),
                                    MovieSchedule(startTime: "19:45", endTime: "22:02", remainingSeats: 100, totalSeats: 116),
                                    MovieSchedule(startTime: "22:20", endTime: "00:04", remainingSeats: 116, totalSeats: 116)
                                ]
                            )
                        ]
                    ),
                    TheaterModel(
                        region: "홍대",
                        selected: false,
                        MovieHalls: [
                            MovieHallModel(
                                name: "BTS관 (7층 1관 [Laser])",
                                format: "2D",
                                schedule: [
                                    MovieSchedule(startTime: "09:30", endTime: "11:50", remainingSeats: 75, totalSeats: 116),
                                    MovieSchedule(startTime: "12:00", endTime: "14:26", remainingSeats: 102, totalSeats: 116),
                                    MovieSchedule(startTime: "14:45", endTime: "17:04", remainingSeats: 88, totalSeats: 116)
                                ]
                            ),
                            MovieHallModel(
                                name: "BTS관 (9층 2관 [Laser])",
                                format: "2D",
                                schedule: [
                                    MovieSchedule(startTime: "11:30", endTime: "13:50", remainingSeats: 34, totalSeats: 116),
                                    MovieSchedule(startTime: "14:10", endTime: "16:32", remainingSeats: 100, totalSeats: 116),
                                    MovieSchedule(startTime: "16:50", endTime: "19:00", remainingSeats: 113, totalSeats: 116),
                                    MovieSchedule(startTime: "19:30", endTime: "21:40", remainingSeats: 92, totalSeats: 116)
                                ]
                            )
                        ]
                    ),
                    TheaterModel(
                        region: "신촌",
                        selected: false,
                        MovieHalls: []
                    )
                ]
                        
        $selectedMovie
            .map { !$0.title.isEmpty }
            .assign(to: \.isTheaterSelectable, on: self)
            .store(in: &cancellables)
        
        $TheaterList
            .map { theaters in
                theaters.contains(where: { $0.selected })
            }
            .assign(to: \.isDateSelectable, on: self)
            .store(in: &cancellables)
        
        Publishers.CombineLatest3($selectedMovie, $TheaterList, $selectedDate)
            .map { movie, theaters, date in
                let hasMovie = !movie.title.isEmpty
                let hasTheater = theaters.contains(where: { $0.selected })
                let hasDate = true 
                return hasMovie && hasTheater && hasDate
            }
            .assign(to: \.isTimeSelectable, on: self)
            .store(in: &cancellables)

        self.weekDays = makeWeekDays()
    }
    
    func selectMovie(_ movie: MovieCard) {
        self.selectedMovie = movie
    }
    
    var currentWeek: Date
    var calendar: Calendar
    
    @Published var weekDays: [WeekDay] = []
    @Published var selectedDate: Date
    
    func makeWeekDays() -> [WeekDay] {
        let today = Date()
        var days: [WeekDay] = []
        
        for i in 0..<7 {
            if let date = Calendar.current.date(byAdding: .day, value: i, to: today) {
                let formatter = DateFormatter()
                formatter.locale = Locale(identifier: "ko_KR")
                formatter.dateFormat = "E"
                let day = formatter.string(from: date)
                days.append(WeekDay(day: day, date: date))
            }
        }
        return days
    }
    
    func dateToString(_ date: Date, selected: Bool) -> String {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.month, .day], from: date)
        guard let month = components.month, let day = components.day else { return "" }
        return selected ? "\(month).\(day)" : "\(day)"
    }
    
    func weekdayLabel(for date: Date) -> String {
        let calendar = Calendar.current
        if calendar.isDateInToday(date) { return "오늘" }
        if calendar.isDateInTomorrow(date) { return "내일" }
        
        let weekday = calendar.component(.weekday, from: date)
        return ["일", "월", "화", "수", "목", "금", "토"][weekday - 1]
    }
    
     func selectDate(_ date: Date) {
         self.selectedDate = date
    }
}
