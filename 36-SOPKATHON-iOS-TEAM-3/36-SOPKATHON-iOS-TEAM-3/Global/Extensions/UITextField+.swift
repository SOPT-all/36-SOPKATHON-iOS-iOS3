//
//  UITextField+.swift
//  36-SOPKATHON-iOS-TEAM-3
//
//  Created by 김나연 on 5/18/25.
//

import UIKit

extension UITextField {
    /// placeholder 색 바꾸기
    func setPlaceholderColor(_ placeholderColor: UIColor) {
        attributedPlaceholder = NSAttributedString(
            string: placeholder ?? "",
            attributes: [
                .foregroundColor: placeholderColor,
                .font: font
            ].compactMapValues { $0 }
        )
    }
}
