//
//  applyView.swift
//  AppJam-29
//
//  Created by 박준원 on 2/9/25.
//

import SwiftUI

struct applyView: View {
    @Environment(\.dismiss) var dismiss
    @State private var introduction: String = ""
    @FocusState private var isEditing: Bool

    var body: some View {
        ZStack {
            Color(red: 0.07, green: 0.07, blue: 0.07)
                .ignoresSafeArea()
            
            VStack(spacing: 16) {
                ZStack {
                    Text("지원하기")
                        .font(Font.custom("Pretendard", size: 22).weight(.medium))
                        .foregroundColor(.white)
                    HStack {
                        Button(action: {
                            dismiss()
                        }) {
                            Image("backButton")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                        }
                        .padding(.leading, 16)
                        Spacer()
                    }
                }
                .padding(.top, 16)
                
                Color.clear
                    .frame(height: 15)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("자기소개서 (필수) *")
                        .font(Font.custom("Pretendard", size: 14).weight(.medium))
                        .foregroundColor(Color(red: 0.71, green: 0.71, blue: 0.71))
                    
                    ZStack(alignment: .topLeading) {
                        if introduction.isEmpty && !isEditing {
                            Text("자기소개서를 작성해주세요 (최대 1,000자)")
                                .font(Font.custom("Pretendard", size: 16).weight(.medium))
                                .lineSpacing(20)
                                .foregroundColor(Color(red: 0.71, green: 0.71, blue: 0.71))
                                .padding(EdgeInsets(top: 12, leading: 8, bottom: 60, trailing: 8))
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        TextEditor(text: $introduction)
                            .focused($isEditing)
                            .font(Font.custom("Pretendard", size: 16).weight(.medium))
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: 12, leading: 8, bottom: 60, trailing: 8))
                            .background(Color.clear)
                            .scrollContentBackground(.hidden)
                    }
                    .frame(width: 329, height: 92)
                    .cornerRadius(5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .inset(by: 0.50)
                            .stroke(Color(red: 0.71, green: 0.71, blue: 0.71), lineWidth: 0.50)
                    )
                }
                .padding(16)
                .background(Color(red: 0.17, green: 0.17, blue: 0.17))
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color(red: 0.24, green: 0.24, blue: 0.24), lineWidth: 0.5)
                )
                .padding(.horizontal, 16)
                
                Spacer()
                
                Button(action: {
                }) {
                    Text("제출하기")
                        .font(Font.custom("Pretendard", size: 16).weight(.semibold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(red: 0.44, green: 0.35, blue: 1))
                        .cornerRadius(8)
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 40)
            }
        }
    }
}

struct applyView_Previews: PreviewProvider {
    static var previews: some View {
        applyView()
            .previewDevice("iPhone 16 Pro")
    }
}
