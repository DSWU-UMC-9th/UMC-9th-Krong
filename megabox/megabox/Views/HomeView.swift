//
//  HomeView.swift
//  megabox
//
//  Created by 정서영 on 10/5/25.
//

import SwiftUI

struct HomeView: View {
    
    @State private var viewModel = HomeViewModel()
    
    var body: some View {
        ScrollView{
            LazyVStack{
                HeaderGroup
                MovieCardGroup
                FunnyMovieGroup
            }
            .padding()
        }
    }
    
    private var HeaderGroup: some View {
        HStack{
            VStack(alignment: .leading){
                Image(.meboxSmallLogo)
                
                HStack(spacing: 31){
                    Group{
                        Text("홈")
                            .foregroundStyle(.black)
                        Text("이벤트")
                        Text("스토어")
                        Text("선호극장")
                    }
                    .font(.semibold24)
                    .foregroundStyle(.gray04)
                }
            }
            Spacer()
        }
    }
    
    private var MovieCardGroup: some View {
        VStack(alignment: .leading, spacing: 25){
            HStack(spacing: 23){
                Button(action:{
                    print("무비차트")
                }, label: {
                    Text("무비차트")
                        .font(.medium14)
                        .foregroundStyle(.white)
                        .padding(.vertical, 10.5)
                        .padding(.horizontal, 18.5)
                        .background(){
                            RoundedRectangle(cornerRadius: 100)
                                .foregroundStyle(.gray08)
                        }
                })
                
                Button(action:{
                    print("상영예정")
                }, label: {
                    Text("상영예정")
                        .font(.medium14)
                        .foregroundStyle(.gray04)
                        .padding(.vertical, 10.5)
                        .padding(.horizontal, 18.5)
                        .background(){
                            RoundedRectangle(cornerRadius: 100)
                                .foregroundStyle(.gray02)
                        }
                })
            }
            .padding(.leading, 2)
            
            ScrollView(.horizontal){
                LazyHStack{
                    ForEach(viewModel.MovieCard.indices, id: \.self){ index in
                        VStack(alignment: .leading){
                            viewModel.MovieCard[index].poster
                            
                            Button(action:{
                                print("바로 예매")
                            }, label: {
                                Text("바로 예매")
                                    .font(.medium16)
                                    .foregroundStyle(.purple03)
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 8.5)
                                    .background(){
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(.purple03 ,lineWidth: 1)
                                    }
                            })
                            
                            Text(viewModel.MovieCard[index].title)
                                .foregroundStyle(.black)
                                .font(.bold22)
                                .lineLimit(1)
                            
                            Text("누적관객수 " + viewModel.MovieCard[index].audience)
                                .font(.medium18)
                                .foregroundStyle(.black)
                        }
                        .frame(width: 148)
                        
                    }
                }
            }
        }
        .padding(.bottom, 39)
    }
    
    private var FunnyMovieGroup: some View {
        VStack(alignment: .leading){
            HStack{
                Text("알고보면 더 재밌는 무비피드")
                    .font(.bold24)
                Spacer()
                Image(systemName: "arrow.right")
            }
            Image(.funnyMovie)
                .padding(.bottom, 44)
            
            ForEach(viewModel.FunnyMovieCard.indices, id: \.self){index in
                HStack{
                    viewModel.FunnyMovieCard[index].poster
                    
                    VStack(alignment: .leading){
                        Text(viewModel.FunnyMovieCard[index].title)
                            .font(.semibold18)
                        Spacer()
                        Text(viewModel.FunnyMovieCard[index].info)
                            .font(.semibold13)
                            .foregroundStyle(.gray03)
                            .padding(.bottom, 12)
                    }
                }
                .padding(.bottom, 39)
            }
        }
    }
}

#Preview {
    HomeView()
}
