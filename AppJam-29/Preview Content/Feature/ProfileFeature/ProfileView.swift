//
//  ProfileView.swift
//  AppJam-29
//
//  Created by 서지완 on 2/9/25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack {
            Color.black900.ignoresSafeArea()
            VStack(spacing: 0) {
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
                    }

                    HStack(spacing: 10) {
                        Image("1")
                            .resizable()
                            .frame(width: 35, height: 35)
                        Image("2")
                            .resizable()
                            .frame(width: 35, height: 35)
                        Image("3")
                            .resizable()
                            .frame(width: 35, height: 35)
                    }

                    Rectangle()
                        .frame(height: 1)
                        .foregroundStyle(.black90)

                    HStack(spacing: 0) {
                        Text("프로필 편집")
                            .font(.pretendard(.medium, size: 16))
                            .foregroundStyle(.black0)
                        Spacer()

                        Image("miniLeftButton")
                    }
                }
                .padding(.vertical, 16)
                .padding(.horizontal, 28)
                .background(
                    Color.black700
                )
                .cornerRadius(24)
                .overlay(
                    RoundedRectangle(cornerRadius: 24)
                        .stroke(Color.black600, lineWidth: 2) //
                )
                .padding(.horizontal, 30)
                .padding(.top, 100)

                VStack(spacing: 0) {
                    Text("밥콕")
                        .font(.pretendard(.medium, size: 20))
                        .color(.black0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 26)

                    Text("전국 학교의 급식을 확인할 수 있는 어플")
                        .font(.pretendard(.regular, size: 14))
                        .color(.black70)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 26)

                    Image("test1")
                        .frame(maxWidth: .infinity)
                        .frame(height: 200)
                        .padding(.horizontal, 30)
                        .cornerRadius(24)

                    Rectangle()
                        .frame(height: 1)
                        .padding(.horizontal, 30)
                        .foregroundStyle(.black70)

                    HStack(spacing: 0) {
                        Text("자세히 보기")
                            .color(.black90)
                            .font(.pretendard(.medium, size: 16))
                        Spacer()
                        Image("leftBack")
                    }
                    .padding(.horizontal, 30)
                    .padding(.top, 10)
                }
                .padding(.vertical, 16)
                .background(
                    Color.black600
                )
                .cornerRadius(24)
                .padding(.horizontal, 30)
                Spacer()
            }
        }
    }
}

#Preview {
    ProfileView()
}
