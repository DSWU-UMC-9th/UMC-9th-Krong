//
//  MovieDetailView.swift
//  megabox
//
//  Created by 정서영 on 10/5/25.
//

import SwiftUI

struct MovieDetailView: View {
    
    let movieTitle: String
    let moviePoster: Image
    @Environment(\.dismiss) var dismiss
    private let viewModel = HomeViewModel()
    
    private var selectedMovie: MovieDetail? {
        viewModel.MovieDetail.first { $0.title == movieTitle }
    }
    
    var body: some View {
        VStack{
            TopBar
            if let detail = selectedMovie{
                movieInfoGroup(detail)
                additionalInfoGroup(detail)
            }
            Spacer()
        }
        .navigationBarBackButtonHidden()
    }
    
    private var TopBar: some View {
        ZStack{
            Text(movieTitle)
                .font(.medium16)
            HStack{
                Button(action: {
                    dismiss()
                }, label: {
                    Image(.goBack)
                        .resizable()
                        .frame(width: 26, height: 22)
                })
                Spacer()
            }
        }
        .padding(15)
    }
    
    private func movieInfoGroup(_ detail: MovieDetail) -> some View {
        VStack(spacing: 10){
            
            detail.image
            
            Text(movieTitle)
                .font(.bold24)
            
            Text(detail.englishTitle)
                .font(.semibold14)
                .foregroundStyle(.gray03)
            
            Text(detail.movieInfo)
            .font(.semibold18)
            .foregroundStyle(.gray03)
            .padding(.horizontal, 15)
        }
        .padding(.bottom, 35)
    }
    
    private func additionalInfoGroup(_ detail: MovieDetail) ->  some View {
        VStack{
            HStack{
                VStack{
                    Text("상세 정보")
                    Rectangle()
                        .frame(width: .infinity, height: 2)
                }
                .foregroundStyle(.black)
                
                VStack{
                    Text("실관람평")
                    Rectangle()
                        .frame(width: .infinity, height: 2)
                }
                .foregroundStyle(.gray02)
            }
            .font(.bold22)
            
            HStack(alignment: .top){
                moviePoster
                    .resizable()
                    .frame(width: 100, height: 120)
                VStack(spacing: 10){
                    Text(detail.age)
                    Text(detail.date)
                }
                .font(.semibold13)
                Spacer()
            }
            .padding(15)
        }
    }
}

#Preview {
    MovieDetailView(movieTitle: "F1 다 무비", moviePoster: .init(.movie3))
}
