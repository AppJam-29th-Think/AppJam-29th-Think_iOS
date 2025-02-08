//
//  InfoInputView.swift
//  AppJam-29
//
//  Created by 서지완 on 2/8/25.
//

import SwiftUI

struct InfoInputView: View {
    @State var nameTextField: String = ""
    @State var emailTextField: String = ""
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

                    HStack {
                        Text("어서오세요!")
                            .font(.pretendard(.bold, size: 24))
                            .foregroundStyle(.black0)
                            .padding(.top, 24)
                            .padding(.leading, 16)
                        Spacer()
                    }

                    HStack {
                        Text("Think에 오신것을 환영해요!")
                            .font(.pretendard(.bold, size: 24))
                            .foregroundStyle(.blue300)
                            .padding(.leading, 16)
                        Spacer()
                    }

                    VStack {
                        HStack(spacing: 2) {
                            Text("이름 (필수)")
                                .font(.pretendard(.medium, size: 14))
                                .foregroundStyle(.black60)
                                .padding(.top, 12)
                                .padding(.leading, 16)
                            Text(" ⃰")
                                .foregroundStyle(.red)
                                .padding(.top, 14)
                                .font(.pretendard(.medium, size: 14))

                        }
                        .frame(maxWidth: .infinity, alignment: .leading)

                        TextField("", text: $nameTextField)
                            .font(.pretendard(.medium, size: 16))
                            .foregroundStyle(.black0)
                            .padding(.leading, 16)
                            .frame(height: 18)
                            .placeholder(when: nameTextField.isEmpty) {
                                Text("이름을 입력해주세요.")
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
                    .padding(.top, 53)

                    VStack {
                        HStack(spacing: 2) {
                            Text("이메일 (필수)")
                                .font(.pretendard(.medium, size: 14))
                                .foregroundStyle(.black60)
                                .padding(.top, 12)
                                .padding(.leading, 16)
                            Text(" ⃰")
                                .foregroundStyle(.red)
                                .padding(.top, 14)
                                .font(.pretendard(.medium, size: 14))

                        }
                        .frame(maxWidth: .infinity, alignment: .leading)

                        TextField("", text: $emailTextField)
                            .font(.pretendard(.medium, size: 16))
                            .foregroundStyle(.black0)
                            .padding(.leading, 16)
                            .frame(height: 18)
                            .placeholder(when: emailTextField.isEmpty) {
                                Text("이메일을 입력해주세요.")
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
                    .padding(.top, 20)


                    Spacer()
                    NavigationLink(destination: ProfileInfoInputView()) {
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

struct CustomTextField: View {
    @State private var nameTextField: String = ""

    var body: some View {
        ZStack(alignment: .leading) {
            if nameTextField.isEmpty {
                Text("이름을 입력해주세요.")
                    .font(.pretendard(.medium, size: 16))
                    .foregroundColor(.color(.black300)) // ✅ 플레이스홀더 색상 변경
                    .padding(.leading, 16)
            }

            TextField("", text: $nameTextField)
                .font(.pretendard(.medium, size: 16))
                .foregroundColor(.color(.black0)) // ✅ 입력된 텍스트 색상
                .padding(.leading, 16)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 8).fill(.black100))
    }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content
    ) -> some View {
        ZStack(alignment: alignment) {
            if shouldShow { placeholder() }
            self
        }
    }
}

//#Preview {
//    InfoInputView()
//}
