//
//  SplashView.swift
//  megabox
//
//  Created by 정서영 on 9/21/25.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack(alignment: .center){
            Color.white
                .ignoresSafeArea()
            Image(.meboxLogo)
        }
    }
}

#Preview {
    SplashView()
}
