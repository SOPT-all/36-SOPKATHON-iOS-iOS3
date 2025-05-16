//
//  UIFont+.swift
//  36-SOPKATHON-iOS-TEAM-3
//
//  Created by 김나연 on 5/17/25.
//

import UIKit

enum FontName: String {
    case pretendardRegular = "Pretendard-Regular" //400
    case pretendardMedium = "Pretendard-Medium" //500
    case pretendardSemiBold = "Pretendard-SemiBold" //600
    case pretendardBold = "Pretendard-Bold" //700
}

//titleLabel.font = .pretendard(.pretendardBold, size: 20) <- 이런식으로 씁니다
extension UIFont {
    static func pretendard(_ weight: FontName, size: CGFloat) -> UIFont {
        return UIFont(name: weight.rawValue, size: size) ?? .systemFont(ofSize: size)
    }
}
