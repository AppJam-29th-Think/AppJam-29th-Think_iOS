//
//  ContentView.swift
//  AppJam-29
//
//  Created by 서지완 on 2/8/25.
//

import SwiftUI

struct ContentView: View {
    enum Tab {
        case a, b, c
    }

    @State private var selected: Tab = .a

    var body: some View {
        ZStack {
            TabView(selection: $selected) {
                Group {
                    NavigationStack {
                        MainView()
                    }
                    .tag(Tab.a)

                    NavigationStack {
                        PostListView()
                    }
                    .tag(Tab.b)

                    NavigationStack {
                        CView()
                    }
                    .tag(Tab.c)
                }
                .toolbar(.hidden, for: .tabBar)
            }

            VStack {
                Spacer()
                tabBar
            }
        }
    }

    var tabBar: some View {
        HStack(spacing: 30) {
            Spacer()
            Button {
                selected = .a
            } label: {
                VStack(alignment: .center) {
                    Image(selected == .a ? "tintHome" : "noHome")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 22)
                    if selected == .a {
                        Text("홈")
                            .font(.pretendard(.semiBold, size: 12))
                    }
                }
            }
            .foregroundStyle(selected == .a ? .blue300 : .black80)
            Spacer()
            Button {
                selected = .b
            } label: {
                VStack(alignment: .center) {
                    Image(selected == .b ? "tintPost" : "noPost")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 22)
                    if selected == .b {
                        Text("게시글")
                            .font(.pretendard(.semiBold, size: 12))
                    }
                }
            }
            .foregroundStyle(selected == .b ? .blue300 : .black80)
            Spacer()
            Button {
                selected = .c
            } label: {
                VStack(alignment: .center) {
                    Image(selected == .c ? "tintProfile" : "noProfile")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 22)
                    if selected == .c {
                        Text("프로필")
                            .font(.pretendard(.semiBold, size: 12))
                    }
                }
            }
            .foregroundStyle(selected == .c ? .blue300 : .black80)
            Spacer()
        }
        .padding()
        .frame(height: 72)
        .background {
            RoundedRectangle(cornerRadius: 95)
                .fill(.black700)
                .shadow(color: .black.opacity(0.15), radius: 8, y: 2)
        }
        .padding(.horizontal)
    }
}

struct AView: View {
    var body: some View {
        Text("View A")
    }
}

struct BView: View {
    var body: some View {
        Text("View B")
    }
}

struct CView: View {
    var body: some View {
        Text("View C")
    }
}

#Preview {
    ContentView()
}
