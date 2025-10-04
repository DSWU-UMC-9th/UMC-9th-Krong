//
//  TabView.swift
//  megabox
//
//  Created by 정서영 on 10/5/25.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            Tab("홈", systemImage: "house.fill"){
                HomeView()
            }
            Tab("바로 예매", systemImage: "play.laptopcomputer"){
                
            }
            Tab("모바일 오더", systemImage: "popcorn"){
                
            }
            Tab("마이 페이지", systemImage: "person"){
                UserInfoView()
            }
        }
    }
}

#Preview {
    TabBar()
}
