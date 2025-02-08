//
//  PostListView.swift
//  AppJam-29
//
//  Created by 서지완 on 2/9/25.
//

import SwiftUI

struct PostListView: View {
    @State var searchTextField: String = ""

    var body: some View {
        ZStack {
            Color.black900.ignoresSafeArea()
            VStack {
                HStack(spacing: 0) {
                    Image("think")
                    Spacer()
                    Image("notification")
                }
                .padding(.horizontal, 20)

                ZStack {
                    TextField("", text: $searchTextField)
                        .frame(height: 18)
                        .padding(.leading, 21)
                        .padding(.vertical, 12)
                        .placeholder(when: searchTextField.isEmpty) {
                            Text("관심있는 내용을 검색해보세요!")
                                .foregroundColor(.color(.black100))
                                .font(.pretendard(.semiBold, size: 16))
                                .padding(.leading, 21)
                        }
                        .background(
                            Color.black700
                        )
                        .cornerRadius(999)
                        .padding(.horizontal, 21)
                        .frame(height: 18)
                    HStack {
                        Spacer()
                        Image("vector")
                    }
                    .padding(.trailing, 40)
                }
                .padding(.top, 20)
                .padding(.bottom, 10)

                ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    HStack(spacing: 0) {
                        Image("user")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                            .padding(6)
                            .overlay(
                                Circle()
                                    .stroke(Color.black70, lineWidth: 3) //
                            )

                        VStack(alignment: .leading, spacing: 0) {
                            Text("서지완")
                                .font(.pretendard(.semiBold, size: 18))
                                .foregroundStyle(.black0)
                            Text("iOS Developer")
                                .font(.pretendard(.medium, size: 14))
                                .foregroundStyle(.black40)
                        }
                        .padding(.leading, 12)

                        Spacer()
                        HStack(spacing: 5) {
                            Image("heart")

                            Text("2555")
                                .font(.pretendard(.regular, size: 12))
                                .foregroundStyle(.black0)
                        }
                    }

                    Text("밥콕")
                        .font(.pretendard(.medium, size: 20))
                        .foregroundStyle(.black0)

                    Text("전국 학교의 급식을 확인할 수 있는 어플")
                        .font(.pretendard(.medium, size: 14))
                        .foregroundStyle(.black70)

                    Image("test1")
                        .cornerRadius(24)
                        .overlay(
                            RoundedRectangle(cornerRadius: 24)
                                .stroke(Color.black700, lineWidth: 1) //
                        )
                }
                .padding(.vertical, 16)
                .padding(.horizontal, 20)
                .background(
                    Color.black700
                )
                .cornerRadius(24)
                .padding(.horizontal, 21)
                .padding(.top, 20)
                Spacer()
            }
            }
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Image("plg")
                }
                .padding(.trailing, 35)
            }
            .padding(.bottom, 100)
        }
    }
}

