//
//  LoginView.swift
//  megabox
//
//  Created by 정서영 on 9/21/25.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack{
            TopBarGroup
            Spacer()
            LoginGroup
            Spacer().frame(height:75)
            ButtonGroup
            Spacer().frame(height:35)
            SocialLoginGroup
            Spacer().frame(height:39)
            AdPosterGroup
        }
        .padding()
    }
    
    private var TopBarGroup: some View {
        HStack{
            Text("로그인")
                .font(.semibold24)
                .foregroundStyle(.black)
        }
    }
    
    private var LoginGroup: some View{
        VStack{
            TextField("아이디", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
            Divider()
            Spacer().frame(height:40)
            SecureField("비밀번호", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
            Divider()
        }
    }
    
    private var ButtonGroup: some View {
        VStack(spacing:17){
            Button(action: {
                print("로그인")
            }, label: {
                Text("로그인")
                    .font(.bold18)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, minHeight: 54)
                    .background(){
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(.purple03)
                    }
            })
            
            Button(action: {
                print("회원가입")
            }, label: {
                Text("회원가입")
                    .font(.medium13)
                    .foregroundStyle(.gray04)
            })
        }
    }
    
    private var SocialLoginGroup: some View {
        HStack{
            Button(action:{
                print("네이버 로그인")
            }, label:{
                Image(.naver)
            })
            Spacer()
            Button(action:{
                print("카카오 로그인")
            }, label:{
                Image(.kakao)
            })
            Spacer()
            Button(action:{
                print("애플 로그인")
            }, label:{
                Image(.apple)
            })
        }
        .padding(.horizontal, 71)
    }
    
    private var AdPosterGroup: some View {
        Image(.umc)
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

#Preview {
    LoginView()
}
