//
//  ProfileInfoInputView.swift
//  AppJam-29
//
//  Created by 서지완 on 2/8/25.
//

import SwiftUI

struct ProfileInfoInputView: View {
    @State var myDescriptionTextField: String = ""
    @Environment(\.dismiss) private var dismiss


    var body: some View {
        NavigationStack {
        ZStack {
            Color.black900.ignoresSafeArea()

                VStack(spacing: 0) {
                    HStack {
                        Button {
                            dismiss()
                        } label: {
                            Image("backButton")
                                .padding(.top, 4)
                                .padding(.leading, 16)
                        }

                        Spacer()
                    }

                    Text("프로필을\n추가해 주세요")
                        .font(.pretendard(.bold, size: 24))
                        .foregroundStyle(.black0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 16)
                        .padding(.top, 28)
                    Text("사진을 선택해주세요 (선택)")
                        .font(.pretendard(.medium, size: 13))
                        .foregroundStyle(.black60)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 16)
                        .padding(.top, 10)

                    Image("setProfile")
                        .padding(.top, 54)
                    Text("서지완님")
                        .font(.pretendard(.bold, size: 20))
                        .foregroundStyle(.black0)
                        .padding(.top, 20)

                    Text(AttributedString("me@xixn2.dev", attributes: AttributeContainer([.link: nil])))
                        .foregroundStyle(.black60)
                        .font(.pretendard(.medium, size: 13))
                        .padding(.top, 3)

                    VStack {
                        Text("프로필 글 (선택)")
                            .font(.pretendard(.medium, size: 14))
                            .foregroundStyle(.black60)
                            .padding(.top, 12)
                            .padding(.leading, 16)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        TextField("", text: $myDescriptionTextField)
                            .font(.pretendard(.medium, size: 16))
                            .foregroundStyle(.black0)
                            .padding(.leading, 16)
                            .frame(height: 18)
                            .placeholder(when: myDescriptionTextField.isEmpty) {
                                Text("프로필 글을 입력해주세요.")
                                    .foregroundColor(.color(.black300))
                                    .font(.pretendard(.medium, size: 16))
                                    .padding(.leading, 16)
                            }
                            .frame(height: 18)

                        Rectangle()
                            .frame(height: 1)
                            .padding(.horizontal, 16)
                            .foregroundStyle(.black60)
                            .padding(.bottom, 12)
                    }
                    .background(Color.black700)
                    .cornerRadius(12)
                    .padding(.horizontal, 16)
                    .padding(.top, 41)

                    Spacer()

                    NavigationLink(destination: TestView()) {
                        Text("넘어가기")
                            .font(.pretendard(.semiBold, size: 16))
                            .color(.black0)
                            .padding(.horizontal, 156)
                            .padding(.vertical, 14)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(.blue300)
                                
                            )
                            .padding(.bottom, 23)
                    }

                }

            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

//#Preview {
//    ProfileInfoInputView()
//}
