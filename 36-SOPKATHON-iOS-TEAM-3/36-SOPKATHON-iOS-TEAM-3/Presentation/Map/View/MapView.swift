//
//  MapView.swift
//  36-SOPKATHON-iOS-TEAM-3
//
//  Created by 안치욱 on 5/18/25.
//

import UIKit
import SnapKit
import Then

final class MapView: BaseUIView {
    
    private var walkNum: Int = 105
    
    private let mapImageView = UIImageView().then {
        $0.image = .map
    }
    
    private let customPopUp = CustomPopUpView()
    
    private lazy var button1 = CircleButton().then {
        $0.text = "1"
    }
    
    private let button2 = CircleButton().then {
        $0.text = "2"
    }
    
    private let button3 = CircleButton().then {
        $0.text = "3"
    }
    
    private let button4 = CircleButton().then {
        $0.text = "4"
    }
    
    private let button5 = CircleButton().then {
        $0.text = "5"
    }
    
    private let button6 = CircleButton().then {
        $0.text = "6"
    }
    
    private let button7 = CircleButton().then {
        $0.text = "7"
    }
    
    private let button8 = CircleButton().then {
        $0.text = "8"
    }
    
    private let button9 = CircleButton().then {
        $0.text = "9"
    }
    
    private let button10 = CircleButton().then {
        $0.text = "10"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        activateButton()
        self.isUserInteractionEnabled = true
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func activateButton() {
        
        if walkNum >= 50 {
            button1.updateStateUI()
            button1.addTarget(self, action: #selector(button1Tap), for: .touchUpInside)
            button1.isUserInteractionEnabled = true
        }
        if walkNum >= 100 {
            button2.updateStateUI()
            button2.addTarget(self, action: #selector(button2Tap), for: .touchUpInside)
            button2.isUserInteractionEnabled = true
        }
        if walkNum >= 150 {
            button3.updateStateUI()
            button3.addTarget(self, action: #selector(button1Tap), for: .touchUpInside)
            button3.isUserInteractionEnabled = true
        }
        if walkNum >= 200 {
            button4.updateStateUI()
            button4.addTarget(self, action: #selector(button2Tap), for: .touchUpInside)
            button4.isUserInteractionEnabled = true
        }
        if walkNum >= 250 {
            button5.updateStateUI()
            button5.addTarget(self, action: #selector(button1Tap), for: .touchUpInside)
            button5.isUserInteractionEnabled = true
        }
        if walkNum >= 300 {
            button6.updateStateUI()
            button6.addTarget(self, action: #selector(button2Tap), for: .touchUpInside)
            button6.isUserInteractionEnabled = true
        }
        if walkNum >= 350 {
            button7.updateStateUI()
            button7.addTarget(self, action: #selector(button1Tap), for: .touchUpInside)
            button7.isUserInteractionEnabled = true
        }
        if walkNum >= 400 {
            button8.updateStateUI()
            button8.addTarget(self, action: #selector(button2Tap), for: .touchUpInside)
            button8.isUserInteractionEnabled = true
        }
        if walkNum >= 450 {
            button9.updateStateUI()
            button9.addTarget(self, action: #selector(button1Tap), for: .touchUpInside)
            button9.isUserInteractionEnabled = true
        }
        if walkNum >= 500 {
            button10.updateStateUI()
            button10.addTarget(self, action: #selector(button2Tap), for: .touchUpInside)
            button10.isUserInteractionEnabled = true
        }
    }
    
    
    
    override func setUI() {
        self.addSubviews(
            mapImageView,
            button1,
            button2,
            button3,
            button4,
            button5,
            button6,
            button7,
            button8,
            button9,
            button10
        )
    }
    
    override func setLayout() {
        mapImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        button1.snp.makeConstraints {
            $0.top.equalToSuperview().inset(26)
            $0.leading.equalToSuperview().inset(48)
            $0.width.height.equalTo(76)
        }
        button2.snp.makeConstraints {
            $0.top.equalToSuperview().inset(26)
            $0.leading.equalTo(button1.snp.trailing).offset(44)
            $0.width.height.equalTo(76)
        }
        button3.snp.makeConstraints {
            $0.top.equalToSuperview().inset(147)
            $0.trailing.equalToSuperview().inset(61)
            $0.width.height.equalTo(76)
        }
        button4.snp.makeConstraints {
            $0.top.equalToSuperview().inset(147)
            $0.leading.equalToSuperview().inset(115)
            $0.width.height.equalTo(76)
        }
        button5.snp.makeConstraints {
            $0.top.equalToSuperview().inset(268)
            $0.leading.equalToSuperview().offset(62)
            $0.width.height.equalTo(76)
        }
        button6.snp.makeConstraints {
            $0.top.equalToSuperview().inset(268)
            $0.trailing.equalToSuperview().inset(117)
            $0.width.height.equalTo(76)
        }
        button7.snp.makeConstraints {
            $0.top.equalToSuperview().inset(389)
            $0.trailing.equalToSuperview().inset(68)
            $0.width.height.equalTo(76)
        }
        button8.snp.makeConstraints {
            $0.top.equalToSuperview().inset(389)
            $0.leading.equalToSuperview().offset(111)
            $0.width.height.equalTo(76)
        }
        button9.snp.makeConstraints {
            $0.top.equalToSuperview().inset(510)
            $0.leading.equalToSuperview().offset(134)
            $0.width.height.equalTo(76)
        }
        button10.snp.makeConstraints {
            $0.top.equalToSuperview().inset(510)
            $0.trailing.equalToSuperview().inset(45)
            $0.width.height.equalTo(76)
        }
    }
    
    @objc private func button1Tap() {
        customPopUp.number = walkNum
        self.addSubview(customPopUp)
        customPopUp.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(281)
            $0.height.equalTo(340)
        }
    }
    @objc private func button2Tap() {
        customPopUp.number = walkNum
        self.addSubview(customPopUp)
        customPopUp.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(281)
            $0.height.equalTo(340)
        }
    }
    
}
