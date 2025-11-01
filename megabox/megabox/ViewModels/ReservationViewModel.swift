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
    private var cancellables = Set<AnyCancellable>()
    
    init(movies: [MovieCard], currentWeek: Date = Date(), selectedDate: Date = Date(), calendar: Calendar = Calendar.current) {
        self.selectedMovie = movies.first ?? MovieCard(poster: Image(.movie1), title: "", audience: "", age: 0)
        self.currentWeek = currentWeek
        self.selectedDate = selectedDate
        self.calendar = calendar
        
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
        
        self.weekDays = makeWeekDays()
    }
    
    func selectMovie(_ movie: MovieCard) {
        self.selectedMovie = movie
    }
    
    @Published var TheaterList: [TheaterModel] = [
        .init(region: "강남", selected: false),
        .init(region: "홍대", selected: false),
        .init(region: "신촌", selected: false)
    ]
    
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
