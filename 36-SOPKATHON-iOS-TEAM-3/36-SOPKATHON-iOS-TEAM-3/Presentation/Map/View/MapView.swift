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
    
    private let mapImageView = UIImageView().then {
        $0.image = .map
    }
    
    private let button1 = CircleButton().then {
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
    
    
}
