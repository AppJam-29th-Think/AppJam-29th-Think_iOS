import SwiftUI

struct MainView: View {
    @State private var selectedIndex = 0

    var body: some View {
<<<<<<< HEAD
        ZStack {
            Color.black900.ignoresSafeArea()
            VStack {
                HStack(spacing: 0) {
                    Image("think")
                    Spacer()
                    Image("notification")
                }
                .padding(.horizontal, 35)

                ScrollView {
                TabView(selection: $selectedIndex) {
                    ForEach(1...3, id: \.self) { index in
                        Image("test")
                            .tag(index)
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: 200)
                .cornerRadius(24)
                .tabViewStyle(.page)
                .padding(.horizontal, 30)
                .padding(.top, 20)

                HStack(spacing: 12) {
                    Image("box")

                    Text("아이디어 리포트 생성하기")
                        .font(.pretendard(.semiBold, size: 22))
                        .color(.black0)

                    Image("leftBack")
                }
                .padding(.vertical, 21)
                .padding(.horizontal, 35)
                .background(
                    Color.black700
                )
                .cornerRadius(24)
                .overlay(
                    RoundedRectangle(cornerRadius: 24)
                        .stroke(Color.black600, lineWidth: 1) // 원하시는 색상과 두께로 조절하세요.
                )
                .padding(.top, 32)

                Text("인기 아이디어")
                    .font(.pretendard(.semiBold, size: 22))
                    .color(.black0)
                    .padding(.leading, 30)
                    .padding(.top, 15)
                    .frame(maxWidth: .infinity, alignment: .leading)

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

=======
        NavigationStack {
            ZStack {
                Color.black900.ignoresSafeArea()
                VStack {
>>>>>>> 24db3d8 (AlarmView, applyView add)
                    HStack(spacing: 0) {
                        Image("think")
                        Spacer()

                        NavigationLink(destination: AlarmView()) {
                            Image("notification")
                        }
                    }
                    .padding(.horizontal, 20)

                    TabView(selection: $selectedIndex) {
                        ForEach(1...3, id: \.self) { index in
                            Image("test")
                                .tag(index)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 200)
                    .cornerRadius(24)
                    .tabViewStyle(.page)
                    .padding(.horizontal, 30)
                    .padding(.top, 20)

                    HStack(spacing: 12) {
                        Image("box")

                        Text("아이디어 리포트 생성하기")
                            .font(.pretendard(.semiBold, size: 22))
                            .color(.black0)

                        Image("leftBack")
                    }
<<<<<<< HEAD
                    .padding(.horizontal, 30)
                    .padding(.top, 10)
                }
                .padding(.vertical, 16)
                .background(
                    Color.black700
                )
                .cornerRadius(24)
                .padding(.horizontal, 30)

            }
                Spacer()
=======
                    .padding(.vertical, 21)
                    .padding(.horizontal, 35)
                    .background(Color.black700)
                    .cornerRadius(24)
                    .overlay(
                        RoundedRectangle(cornerRadius: 24)
                            .stroke(Color.black600, lineWidth: 1)
                    )
                    .padding(.top, 32)

                    Text("인기 아이디어")
                        .font(.pretendard(.semiBold, size: 22))
                        .color(.black0)
                        .padding(.leading, 30)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    VStack(spacing: 0) {
                        Text("밥콕")
                            .font(.pretendard(.medium, size: 20))
                            .color(.black0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 46)

                        Text("전국 학교의 급식을 확인할 수 있는 어플")
                            .font(.pretendard(.regular, size: 14))
                            .color(.black70)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 46)

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
                    .background(Color.black700)
                    .cornerRadius(24)
                    .overlay(
                        RoundedRectangle(cornerRadius: 24)
                            .stroke(Color.black600, lineWidth: 1)
                    )
                    .padding(.horizontal, 30)

                    Spacer()
                }
>>>>>>> 24db3d8 (AlarmView, applyView add)
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

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
