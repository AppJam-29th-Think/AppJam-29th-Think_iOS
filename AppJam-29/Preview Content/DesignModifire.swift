//
//  DesignModifire.swift
//  AppJam-29
//
//  Created by 서지완 on 2/8/25.
//

import SwiftUI

enum PretendardStyle: String {
    case black = "Pretendard-Black"
    case bold = "Pretendard-Bold"
    case extraBold = "Pretendard-ExtraBold"
    case extraLight = "Pretendard-ExtraLight"
    case light = "Pretendard-Light"
    case medium = "Pretendard-Medium"
    case regular = "Pretendard-Regular"
    case semiBold = "Pretendard-SemiBold"
    case thin = "Pretendard-Thin"
}

extension Font {
    static func pretendard(_ style: PretendardStyle, size: CGFloat) -> Font {
        return .custom(style.rawValue, size: size)
    }
}

enum ColorStyle: String {
    case black0 = "black0"
    case black10 = "black10"
    case black20 = "black20"
    case black30 = "black30"
    case black40 = "black40"
    case black50 = "black50"
    case black60 = "black60"
    case black70 = "black70"
    case black80 = "black80"
    case black90 = "black90"
    case black100 = "black100"
    case black200 = "black200"
    case black300 = "black300"
    case black400 = "black400"
    case black500 = "black500"
    case black600 = "black600"
    case black700 = "black700"
    case black800 = "black800"
    case black900 = "black900"
    case blue50 = "blue50"
    case blue75 = "blue75"
    case blue100 = "blue100"
    case blue200 = "blue200"
    case blue300 = "blue300"
    case blue400 = "blue400"
    case blue500 = "blue500"
}

extension Color {
    static func color(_ style: ColorStyle) -> Color {
        return Color(style.rawValue)
    }
}

extension Text {
    func color(_ style: ColorStyle) -> Text {
        return self.foregroundColor(.color(style))
    }
}

//MARK: 폰트, 컬러 사용 양식
struct DesignModifireView: View {
    var body: some View {
        Text("Hello, Pretendard!")
            .font(.pretendard(.semiBold, size: 20))
            .color(.blue500)
    }
}

#Preview {
    DesignModifireView()
}
