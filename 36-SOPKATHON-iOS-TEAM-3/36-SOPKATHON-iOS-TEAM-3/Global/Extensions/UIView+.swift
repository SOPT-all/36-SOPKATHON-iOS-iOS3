//
//  UIView+.swift
//  36-SOPKATHON-iOS-TEAM-3
//
//  Created by 김나연 on 5/17/25.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
}
