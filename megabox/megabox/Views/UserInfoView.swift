//
//  UserInfoView.swift
//  megabox
//
//  Created by 정서영 on 9/29/25.
//

import SwiftUI

struct UserInfoView: View {

    @AppStorage("id") var id: String = ""
    
    var body: some View {
        VStack{
            TopUserGroup
            MembershipButton
            StatusGroup
            BottomReserGroup
            Spacer()
        }
        .padding(.horizontal, 15)
    }
    
    private var TopUserGroup: some View {
        VStack{
            HStack(spacing: 5){
                Text("\(self.id)님")
                    .font(.bold24)
                Text("WELCOME")
                    .font(.medium14)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(){
                        RoundedRectangle(cornerRadius: 6)
                            .foregroundStyle(.tag)
                    }
                
                Spacer()
                
                Button(action: {
                    print("회원정보")
                }, label: {
                    Text("회원정보")
                        .font(.semibold14)
                        .foregroundStyle(.white)
                        .padding(.horizontal, 11.5)
                        .padding(.vertical, 4)
                        .background(){
                            RoundedRectangle(cornerRadius: 16)
                                .foregroundStyle(.gray07)
                        }
                })
            }
            HStack(spacing: 9){
                Text("멤버십 포인트")
                    .font(.semibold14)
                    .foregroundStyle(.gray04)
                Text("500P")
                    .font(.medium14)
                    .foregroundStyle(.black)
                Spacer()
            }
        }
        .padding(.top, 44)
        .padding(.bottom, 15)
    }
    
    private var MembershipButton: some View {
        Button(action: {
            print("클럽 멤버십")
        }, label: {
                HStack(spacing: 3){
                    Text("클럽 멤버십")
                        .font(.semibold16)
                        .foregroundStyle(.white)
                    Image(systemName: "chevron.right")
                        .foregroundStyle(.white)
                    Spacer()
                }
                .padding(.leading, 8)
                .padding(.vertical, 12)
                .background(){
                    LinearGradient(colors: [.gradientColor1,.gradientColor2, .gradientColor3], startPoint: .leading, endPoint: .trailing)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
        })
    }
    
    private var StatusGroup: some View {
        HStack{
            StatusItem(title: "쿠폰", status: 2)
            
            Spacer()
            Divider()
                .frame(height: 31)
            Spacer()
            
            StatusItem(title: "스토어 교환권", status: 0)
            
            Spacer()
            Divider()
                .frame(height: 31)
            Spacer()
            
            StatusItem(title: "모바일 티켓", status: 0)
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 24)
        .background(){
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.white)
                .stroke(.gray02, lineWidth: 1)
        }
        .padding(.vertical, 33)
    }
    
    private func StatusItem(title: String, status: Int) -> some View {
        VStack(spacing: 9){
            Text(title)
                .font(.semibold16)
                .foregroundStyle(.gray02)
            Text("\(status)")
                .font(.semibold16)
                .foregroundStyle(.black)
        }
    }
    
    private var BottomReserGroup: some View {
        HStack{
            ReserItem(imageName: "movie-pay", title: "영화별예매")
            Spacer()
            ReserItem(imageName: "theater-pay", title: "극장별예매")
            Spacer()
            ReserItem(imageName: "special-pay", title: "특별관예매")
            Spacer()
            ReserItem(imageName: "mobile-pay", title: "모바일오더")
        }
    }
    
    private func ReserItem(imageName: String, title: String) -> some View {
        VStack{
            Image(imageName)
                .resizable()
                .frame(width: 36, height: 36)
            Text(title)
                .font(.medium16)
        }
    }
}

#Preview {
    UserInfoView()
}
