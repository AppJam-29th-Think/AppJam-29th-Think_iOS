//
//  AlarmView.swift
//  AppJam-29
//
//  Created by 박준원 on 2/9/25.
//

import SwiftUI

struct AlarmView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            Color(red: 18/255, green: 18/255, blue: 18/255)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        Image("backButton")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                    }
                    
                    Spacer()
                    
                    Text("알람")
                        .font(.pretendard(.medium, size: 22))
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Color.clear.frame(width: 24, height: 24)
                }
                .padding(.horizontal, 32)
                .padding(.vertical, 16)
                
                VStack(spacing: 0) {
                    NotificationRowView(isHighlighted: false)
                    NotificationRowView(isHighlighted: true)
                    NotificationRowView(isHighlighted: true)
                    NotificationRowView(isHighlighted: false)
                    NotificationRowView(isHighlighted: false)
                }
                .padding(.top, 16)
                
                Spacer()
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct NotificationRowView: View {
    var isHighlighted: Bool = false

    var body: some View {
        HStack(alignment: .center, spacing: 19) {
            HStack(spacing: 10) {
                ZStack {
                    Image("noti")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .frame(width: 38, height: 38)
            }
            .padding(6)
            .frame(width: 38, height: 38)
            .background(Color(red: 0.95, green: 0.93, blue: 1))
            .cornerRadius(20.50)
            .overlay(
                Group {
                    if isHighlighted {
                        Circle()
                            .fill(Color.red)
                            .frame(width: 8, height: 8)
                            .offset(x: 12, y: -12)
                    }
                }
            )
            
            VStack(alignment: .leading, spacing: 14) {
                HStack {
                    Text("게시물 알림")
                        .font(Font.custom("Pretendard", size: 15).weight(.semibold))
                        .lineSpacing(22)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Text("11월 20일")
                        .font(Font.custom("Pretendard", size: 12).weight(.semibold))
                        .lineSpacing(22)
                        .foregroundColor(Color(red: 0.77, green: 0.77, blue: 0.77))
                }
                Text("회원님의 게시물에 하트가 눌렸어요")
                    .font(Font.custom("Pretendard", size: 15))
                    .lineSpacing(22)
                    .foregroundColor(.white)
            }
            .frame(width: 290, alignment: .leading)
        }
        .padding(.vertical, 10)
        .frame(width: 393, height: 90)
        .background(
            isHighlighted ?
                Color(red: 0.12, green: 0.12, blue: 0.12) :
                Color(red: 18/255, green: 18/255, blue: 18/255)
        )
    }
}

struct AlarmView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmView()
            .previewDevice("iPhone 16 Pro")
    }
}
