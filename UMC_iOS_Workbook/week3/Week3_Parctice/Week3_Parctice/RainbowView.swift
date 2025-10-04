//
//  RainbowView.swift
//  Week3_Parctice
//
//  Created by 정서영 on 10/4/25.
//

import SwiftUI

struct RainbowView: View {
    
    var viewModel: RainbowViewModel = .init()
    @State private var navigationTrue: Bool = false
    
    var body: some View {
        NavigationStack{
            VStack{
                colorCardGroup
                
                Spacer()
                
                bottomSelectedColorGroup
            }
            .safeAreaPadding(EdgeInsets(top: 47, leading: 15, bottom: 43, trailing: 15))
            .navigationDestination(isPresented: $navigationTrue, destination: {
                ColorNavigationView(viewModel: viewModel)
            })
        }
    }
    
    private var colorCardGroup: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 40), count: 3), spacing: 26, content: {
            ForEach(RainbowModel.allCases, id: \.self, content: { rainbow in makeColorCard(rainbow)
                    .onTapGesture {
                        viewModel.selectedRainbowModel = rainbow
                        self.navigationTrue.toggle()
                    }
            })
        })
    }
    
    private func makeColorCard(_ model: RainbowModel) -> some View {
        VStack(spacing: 6, content: {
            Rectangle()
                .fill(model.returnColor())
            
            Text(model.returnColorName())
                .foregroundStyle(.black)
                .font(.title)
        })
        .frame(maxWidth: .infinity, minHeight: 110)
    }
    
    private var bottomSelectedColorGroup: some View {
        VStack(spacing: 70, content: {
            Image(.apple)
                .renderingMode(.template)
                .fixedSize()
                .foregroundStyle(viewModel.appleLogoColor ?? Color.black)
            
            Text(selectedColorName())
                .font(.title)
                .foregroundStyle(.black)
        })
    }
    
    private func selectedColorName() -> String {
        if let name = viewModel.selectedRainbowModel {
            return name.returnColorName()
        } else {
            return "아무것도 없음"
        }
    }
}

#Preview {
    RainbowView()
}
