//
//  CustomPopUpView.swift
//  36-SOPKATHON-iOS-TEAM-3
//
//  Created by 안치욱 on 5/18/25.
//

import UIKit
import SnapKit
import Then

final class CustomPopUpView: BaseUIView {
    
    private var number: Int = 0
    
    private let titleLabel = UILabel().then {
        $0.text = "정보 카테고리를 선택하세요"
        $0.font = .pretendard(.pretendardBold, size: 18)
    }
    
    private lazy var foodButton = UIButton().then {
        $0.setTitle("음식", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.setTitleColor(.white, for: .selected)
        $0.titleLabel?.font = .pretendard(.pretendardBold, size: 18)
        $0.backgroundColor = .gray100
        $0.layer.cornerRadius = 12
        $0.addTarget(self, action: #selector(foodTap), for: .touchUpInside)
    }
    
    private lazy var cultureButton = UIButton().then {
        $0.setTitle("문화", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.setTitleColor(.white, for: .selected)
        $0.titleLabel?.font = .pretendard(.pretendardBold, size: 18)
        $0.backgroundColor = .gray100
        $0.layer.cornerRadius = 12
        $0.addTarget(self, action: #selector(cultureTap), for: .touchUpInside)
    }
    
    private lazy var tourButton = UIButton().then {
        $0.setTitle("관광", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.setTitleColor(.white, for: .selected)
        $0.titleLabel?.font = .pretendard(.pretendardBold, size: 18)
        $0.backgroundColor = .gray100
        $0.layer.cornerRadius = 12
        $0.addTarget(self, action: #selector(tourTap), for: .touchUpInside)
    }
    
    override func setUI() {
        self.addSubviews(
            titleLabel,
            foodButton,
            cultureButton,
            tourButton
        )
        self.backgroundColor = .white
    }
    
    override func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(33)
            $0.centerX.equalToSuperview()
        }
        foodButton.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(32)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(61)
        }
        cultureButton.snp.makeConstraints {
            $0.top.equalTo(foodButton.snp.bottom).offset(18)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(61)
        }
        tourButton.snp.makeConstraints {
            $0.top.equalTo(cultureButton.snp.bottom).offset(18)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(61)
        }
    }
    
    @objc func foodTap() {
        
    }
    
    @objc func cultureTap() {
        
    }
    
    @objc func tourTap() {
        
    }
    
}
