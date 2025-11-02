//
//  MovieSearchView.swift
//  megabox
//
//  Created by 정서영 on 11/2/25.
//

import SwiftUI

struct MovieSearchView: View {
    
    @StateObject private var vm: MovieSearchViewModel
    
    init(homeVM: HomeViewModel) {
        _vm = StateObject(wrappedValue: MovieSearchViewModel(homeVM: homeVM))
    }
    
    var body: some View {
        VStack(spacing: 18){
            Text("영화 선택")
                .font(.semibold18)
            
            HStack{
                Image(systemName: "magnifyingglass")
                TextField("Search", text: $vm.query)
                    .background(.gray01)
                Image(systemName: "microphone.fill")
            }
            
            .padding(8)
            .background(.gray01)
            .padding()
            
            if vm.isLoading {
                ProgressView()
                    .padding(.top, 20)
            } else{
                LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 3), spacing: 61){
                    ForEach(vm.results, id:\.id){ movie in
                        VStack{
                            movie.poster
                                .resizable()
                                .frame(width: 95, height: 135)
                            Text(movie.title)
                                .font(.semibold14)
                        }
                    }
                }
            }
            Spacer()

        }
    }
}

#Preview {
    let homeVM = HomeViewModel()
    MovieSearchView(homeVM: homeVM)
}
