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
    
    var body: some View {
        VStack{
            TopBar
            movieInfoGroup
            additionalInfoGroup
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
        .padding(.horizontal, 15)
    }
    
    private var movieInfoGroup: some View {
        VStack(spacing: 10){
            Image(.scene3)
            
            Text(movieTitle)
                .font(.bold24)
            
            Text("F1: The Movie")
                .font(.semibold14)
                .foregroundStyle(.gray03)
            
            Text("""
            최고가 되지 못한 전설 VS 최고가 되고 싶은 루키

            한때 주목받는 유망주였지만 끔찍한 사고로 F1에서 우승하지 못하고
            한순간에 추락한 드라이버 ‘손 헤이스’(브래드 피트).
            그의 오랜 동료인 ‘루벤 세르반테스’(하비에르 바르뎀)에게
            레이싱 복귀를 제안받으며 최하위 팀인 APXGP에 합류한다.
            """)
            .font(.semibold18)
            .foregroundStyle(.gray03)
            .padding(.horizontal, 15)
        }
        .padding(.bottom, 35)
    }
    
    private var additionalInfoGroup: some View {
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
                    Text("12세 이상 관람가")
                    Text("2025.06.25 개봉")
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
