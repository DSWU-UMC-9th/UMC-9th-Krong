//
//  UserSettingView.swift
//  megabox
//
//  Created by 정서영 on 9/29/25.
//

import SwiftUI

struct UserSettingView: View {
    
    @AppStorage("id") var id: String = ""
    @AppStorage("username") var username: String = "사용자 이름"
    @State private var InputName: String = ""
    
    var body: some View {
        VStack{
            TopBar
            UserInfoGroup
            Spacer()
        }
        .padding(.horizontal, 15)
        .task{
            InputName = username
        }
    }
    
    private var TopBar: some View {
        ZStack{
            Text("회원정보 관리")
                .font(.medium16)
            HStack{
                Button(action: {
                    print("뒤로가기")
                }, label: {
                    Image(.goBack)
                        .resizable()
                        .frame(width: 26, height: 22)
                })
                Spacer()
            }
        }
        .padding(.bottom, 53)
    }
    
    private var UserInfoGroup: some View {
        VStack(alignment: .leading){
            Text("기본정보")
                .font(.bold18)
                .padding(.bottom, 26)
            
            Text(id)
                .font(.medium18)
            Divider()
                .padding(.bottom, 24)
            
            HStack{
                TextField("\(username)", text: $InputName)
                    .font(.medium18)
                    .foregroundStyle(.black)
                Button(action:{
                    self.username = InputName
                }, label: {
                    Text("변경")
                        .font(.medium10)
                        .foregroundStyle(.gray03)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(){
                            RoundedRectangle(cornerRadius: 16)
                                .fill(.white)
                                .stroke(.gray03, lineWidth: 1)
                        }
                })
            }
            Divider()
        }
    }
}

#Preview {
    UserSettingView()
}
