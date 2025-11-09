//
//  ReservationView.swift
//  megabox
//
//  Created by 정서영 on 10/30/25.
//

import SwiftUI

struct ReservationView: View {
    private var MovieList = HomeViewModel()
    @StateObject private var viewModel: ReservationViewModel
    @State private var isShowingSheet = false
    
    init() {
        let movieList = HomeViewModel()
        _viewModel = StateObject(wrappedValue: ReservationViewModel(movies: movieList.MovieCard))
    }
    
    var body: some View {
        ScrollView{
            VStack{
                NavigationBar
                MovieSelectGroup
                TheaterSelectGroup
                DateSelectGroup
                if viewModel.isTimeSelectable {
                    TimeSelectGroup
                }
            }
        }
        .ignoresSafeArea()
        .sheet(isPresented: $isShowingSheet) {
            MovieSearchView(homeVM: MovieList, movieSelectVM: viewModel)
        }
    }
    
    private var NavigationBar: some View {
        HStack{
            Spacer()
            Text("영화별 예매")
                .font(.bold22)
                .foregroundStyle(.white)
            Spacer()
        }
        .padding(.top, 80)
        .padding(.bottom, 10)
        .background(.purple03)
    }
    
    private var MovieSelectGroup: some View {
        VStack{
            HStack{
                Text("\(viewModel.selectedMovie.age)")
                    .foregroundStyle(.white)
                    .font(.bold18)
                    .background(.orange)
                Text(viewModel.selectedMovie.title)
                    .font(.bold18)
                Spacer()
                Button(action:{
                    isShowingSheet.toggle()
                }, label: {
                    Text("전체영화")
                        .font(.semibold14)
                        .foregroundStyle(.black)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background{
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(.gray02, lineWidth: 1)
                        }
                })
            }
            .padding()
            
            ScrollView(.horizontal){
                LazyHStack{
                    ForEach(MovieList.MovieCard.indices, id: \.self) {
                        index in
                        Button(action:{
                            viewModel.selectMovie(MovieList.MovieCard[index])
                        }, label:{
                            MovieList.MovieCard[index].poster
                                .resizable()
                                .frame(width: 62, height: 89)
                                .clipShape(
                                    RoundedRectangle(cornerRadius: 10)
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(viewModel.selectedMovie.title == MovieList.MovieCard[index].title ? Color.purple03 : .clear, lineWidth: 3)
                                )
                        })
                        
                    }
                }
            }
            .padding(.horizontal)
        }
    }
    
    private var TheaterSelectGroup: some View {
        HStack{
            ForEach(viewModel.TheaterList.indices, id: \.self) { index in
                Button(action: {
                    viewModel.TheaterList[index].selected.toggle()
                }, label: {
                    Text(viewModel.TheaterList[index].region)
                        .font(.semibold16)
                        .foregroundStyle(viewModel.TheaterList[index].selected == true ? .white : .gray05)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 15)
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundStyle(viewModel.TheaterList[index].selected == true ? .purple03 : .gray01)
                        )
                })
                .disabled(!viewModel.isTheaterSelectable)
            }
            Spacer()
        }
        .padding()
    }
    
    private var DateSelectGroup: some View {
        HStack{
            ForEach(viewModel.weekDays) { day in
                let isSelected = Calendar.current.isDate(day.date, inSameDayAs: viewModel.selectedDate)
                let weekday = Calendar.current.component(.weekday, from: day.date)
                let dateColor: Color = {
                    if isSelected { return .white }
                    else if weekday == 1 { return .red }
                    else if weekday == 7 { return .tag }
                    else { return .black }
                }()
                
                Button(action: {
                    viewModel.selectDate(day.date)
                }, label: {
                    VStack {
                        Text(viewModel.dateToString(day.date, selected: isSelected))
                            .font(.bold18)
                            .foregroundStyle(dateColor)
                        Text(viewModel.weekdayLabel(for: day.date))
                            .font(.semibold14)
                            .foregroundStyle(isSelected ? .white : .gray03)
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 12)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundStyle(isSelected ? .purple03 : .white)
                    )
                })
                .disabled(!viewModel.isDateSelectable)
            }
        }
        .padding(.horizontal)
    }
    
    private var TimeSelectGroup: some View {
        VStack {
            if viewModel.selectedRegions.isEmpty {
                Text("상영 정보가 없습니다.")
                    .foregroundColor(.gray)
            } else {
                ScrollView {
                    ForEach(viewModel.selectedRegions) { region in
                        VStack(alignment: .leading, spacing: 21) {
                            Text(region.region)
                                .font(.bold18)
                            if region.MovieHalls.isEmpty {
                                HStack{
                                Text("상영 정보가 없습니다.")
                                    .foregroundColor(.gray)
                                    .padding(.horizontal)
                                    Spacer()
                                }
                            } else {
                                ForEach(region.MovieHalls) { hall in
                                    VStack(alignment: .leading, spacing: 19) {
                                        HStack {
                                            Text(hall.name)
                                                .font(.bold18)
                                            Spacer()
                                            Text(hall.format)
                                                .font(.semibold14)
                                        }

                                        LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 4), spacing: 36) {
                                            ForEach(hall.schedule) { schedule in
                                                VStack(alignment: .leading) {
                                                    Text(schedule.startTime)
                                                        .font(.bold18)
                                                    Text(schedule.endTime)
                                                        .font(.regular12)
                                                        .foregroundColor(.gray03)
                                                    HStack{
                                                        Text("\(schedule.remainingSeats)")
                                                            .font(.semibold14)
                                                            .foregroundStyle(.purple03)
                                                        Text(" / \(schedule.totalSeats)")
                                                            .font(.semibold14)
                                                            .foregroundStyle(.gray03)
                                                    }
                                                }
                                                .padding(10)
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 12)
                                                        .stroke(Color.gray02, lineWidth: 1)
                                                )
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        .padding()
                    }
                }
            }
        }
    }
}

#Preview {
    ReservationView()
}
