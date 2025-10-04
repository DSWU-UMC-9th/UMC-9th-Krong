//
//  HomeViewModel.swift
//  megabox
//
//  Created by 정서영 on 10/5/25.
//

import SwiftUI

@Observable
class HomeViewModel {
    let MovieCard: [MovieCard] = [
        .init(poster: .init(.movie1), title: "어쩔수가없다", audience: "20만"),
        .init(poster: .init(.movie2), title: "귀멸의 칼날 무한성편", audience: "10만"),
        .init(poster: .init(.movie3), title: "F1 더 무비", audience: "170만"),
        .init(poster: .init(.movie4), title: "얼굴", audience: "52만"),
        .init(poster: .init(.movie5), title: "모노노케 히메", audience: "25만")
    ]
    
    let FunnyMovieCard: [FunnyMovieCard] = [
        .init(poster: .init(.funnyMovie1), title: "9월, 메가박스의 영화들(1) - 명작들의 재개봉", info: "<모노노케 히메>,<퍼펙트 블루>만"),
        .init(poster: .init(.funnyMovie2), title: "메가박스 오리지널 티켓 Re.37 <얼굴>", info: "영화 속 양극적인 감정의 대비만")
    ]
}
