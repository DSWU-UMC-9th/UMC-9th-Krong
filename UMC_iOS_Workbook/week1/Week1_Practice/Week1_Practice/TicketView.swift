//
//  ContentView.swift
//  Week1_Practice
//
//  Created by 정서영 on 9/20/25.
//

import SwiftUI

struct TicketView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .onAppear {
            // 폰트 체크 하기
            UIFont.familyNames.sorted().forEach { familyName in
                print("*** \(familyName) ***")
                UIFont.fontNames(forFamilyName: familyName).forEach { fontName in
                    print("\(fontName)")
                }
                print("---------------------")
            }
        }
        .padding()
    }
}

#Preview {
    TicketView()
}
