//
//  UIStackView+.swift
//  36-SOPKATHON-iOS-TEAM-3
//
//  Created by 김나연 on 5/17/25.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach { addArrangedSubview($0) }
    }
}
