//
//  CircleButton.swift
//  36-SOPKATHON-iOS-TEAM-3
//
//  Created by 안치욱 on 5/18/25.
//

import UIKit
import SnapKit
import Then

final class CircleButton: UIButton {
    
    private let buttonView = UIView()
    
    private let buttonImage = UIImageView().then {
        $0.image = .button
    }
    
    private let numberLabel = UILabel().then {
        $0.font = .pretendard(.pretendardSemiBold, size: 28)
        $0.textColor = .black
    }
    
    var text: String? {
        didSet { numberLabel.text = text }
    }
    
    
    init() {
        super.init(frame: .zero)
        setUI()
        setLayout()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUI() {
        self.addSubviews(
            buttonView
        )
        buttonView.addSubviews(
            buttonImage,
            numberLabel
        )
    }
    
    private func setLayout() {
        buttonView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.width.equalTo(76)
        }
        buttonImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        numberLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    
}
