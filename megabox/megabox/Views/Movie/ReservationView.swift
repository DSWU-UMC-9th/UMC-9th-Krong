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
    
    init() {
        let movieList = HomeViewModel()
        _viewModel = StateObject(wrappedValue: ReservationViewModel(movies: movieList.MovieCard))
    }

    var body: some View {
        ScrollView{
            VStack{
                NavigationBar
                MovieSelectGroup
            }
        }
        .ignoresSafeArea()
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
                    print("전체 영화")
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
}

#Preview {
    ReservationView()
}
