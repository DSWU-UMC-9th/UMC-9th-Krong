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
    
    let MovieDetail: [MovieDetail] = [
        .init(image: .init(.scene3), title: "F1 더 무비", englishTitle: "F1: The Movie",  movieInfo: """
            최고가 되지 못한 전설 VS 최고가 되고 싶은 루키

            한때 주목받는 유망주였지만 끔찍한 사고로 F1에서 우승하지 못하고
            한순간에 추락한 드라이버 ‘손 헤이스’(브래드 피트).
            그의 오랜 동료인 ‘루벤 세르반테스’(하비에르 바르뎀)에게
            레이싱 복귀를 제안받으며 최하위 팀인 APXGP에 합류한다.
            """, age: "12세 이상 관람가", date: "2025.06.25 개봉")
    ]
}
