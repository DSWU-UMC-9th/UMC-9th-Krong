//
//  MovieView.swift
//  Week2_Practice
//
//  Created by 정서영 on 9/28/25.
//

import SwiftUI
import Observation

struct MovieView: View {        
    
    @AppStorage("movieName") private var movieName: String = ""
    private var viewModel: MovieViewModel = .init()

    var body: some View {
        VStack(spacing: 56){
            MovieCard(movieInfo: viewModel.movieModel[viewModel.currentIndex])
            leftRightChange
            settingMovie
            printAppStorageValue
        }
        .padding()
    }
    
    private var leftRightChange: some View {
        HStack(spacing: 61){
            Button(action: {viewModel.previousMovie()}, label:{
                Image(systemName: "chevron.left")
                    .foregroundColor(.black)
            })
            
            Text("영화 바꾸기")
                .font(.system(size: 20))
                .foregroundStyle(Color.black)
            
            Button(action: {viewModel.nextMovie()}, label:{
                Image(systemName: "chevron.right")
                    .foregroundColor(.black)
            })
        }
        .padding(.horizontal, 22)
        .padding(.vertical, 17)
    }
    
    private var settingMovie: some View {
        Button(action:{
            self.movieName = viewModel.movieModel[viewModel.currentIndex].movieName
        }, label: {
            Text("대표 영화로 설정")
                .foregroundStyle(.black)
                .padding(.top, 21)
                .padding(.leading, 52)
                .padding(.bottom, 20)
                .padding(.trailing, 53)
                .overlay{
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.black, lineWidth: 1)
                }
        })
    }
    
    private var printAppStorageValue: some View {
        VStack(spacing: 17){
            Text("@AppStorage에 저장된 영화")
                .font(.system(size: 30, weight: .regular))
                .foregroundStyle(Color.black)
            Text("현재 저장된 영화 : \(movieName)")
                .font(.system(size: 20, weight: .regular))
                .foregroundStyle(Color.red)

        }
    }
    
}

#Preview {
    MovieView()
}
