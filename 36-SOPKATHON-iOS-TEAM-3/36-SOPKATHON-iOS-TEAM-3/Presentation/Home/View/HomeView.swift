//
//  HomeView.swift
//  36-SOPKATHON-iOS-TEAM-3
//
//  Created by 성현주 on 5/17/25.
//

import UIKit
import Then
import SnapKit


final class HomeView: BaseUIView {

    // MARK: - UI Components

    let homeProgressView = HomeProgressView()

    let walkLabel = UILabel().then{
        $0.text = "걸음 횟수: 0"
        $0.font = .boldSystemFont(ofSize: 28)
        $0.textColor = .black
        $0.textAlignment = .center
    }

    //MARK: - Custom Methods

    override func setUI() {
        addSubviews(walkLabel, homeProgressView)
    }

    override func setLayout() {
        walkLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        homeProgressView.snp.makeConstraints {
            $0.top.equalTo(walkLabel.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(10)
        }
    }

}
