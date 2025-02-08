//
//  DevelopStackChoiceView.swift
//  AppJam-29
//
//  Created by 서지완 on 2/8/25.
//

import SwiftUI

struct DevelopStackChoiceView: View {
    let columns = Array(repeating: GridItem(.flexible(), spacing: 5), count: 4)
    @State private var selectedIndices: [Int] = []
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack {
            Color.black900.ignoresSafeArea()

            VStack(spacing: 0) {
                // 상단 네비게이션 바 역할
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

                // 타이틀
                Text("기술 스택을\n선택해 주세요")
                    .font(.pretendard(.bold, size: 24))
                    .foregroundStyle(.black0)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 16)
                    .padding(.top, 28)

                // 그리드 레이아웃
                LazyVGrid(columns: columns, spacing: 15) {
                    ForEach(1...24, id: \.self) { index in
                        Image("\(index)")
                            .cornerRadius(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(selectedIndices.contains(index) ? Color.blue300 : Color.clear, lineWidth: 3)
                            )
                            .shadow(color: selectedIndices.contains(index) ? Color.blue300.opacity(0.5) : Color.clear, radius: 15)
                            .onTapGesture {
                                toggleSelection(for: index)
                            }
                    }
                }
                .padding(.horizontal, 40)
                .padding(.top, 54)

                Spacer()

                // 하단 완료 버튼
                NavigationLink(destination: AppleSignInView()) {
                    Text("완료")
                        .font(.pretendard(.semiBold, size: 16))
                        .foregroundColor(.black0)
                        .padding(.horizontal, 168)
                        .padding(.vertical, 14)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.blue300)
                        )
                        .padding(.bottom, 23)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }

    // body 밖에 위치해야 하는 함수
    private func toggleSelection(for index: Int) {
        if selectedIndices.contains(index) {
            selectedIndices.removeAll { $0 == index }
        } else if selectedIndices.count < 10 {
            selectedIndices.append(index)
        }
    }
}

