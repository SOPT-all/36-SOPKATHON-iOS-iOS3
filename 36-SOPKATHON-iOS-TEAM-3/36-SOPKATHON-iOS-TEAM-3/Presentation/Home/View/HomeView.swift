//
//  HomeView.swift
//  36-SOPKATHON-iOS-TEAM-3
//
//  Created by 성현주 on 5/17/25.
//

import UIKit

import SnapKit
import Then

final class HomeView: BaseUIView {

    // MARK: - UI Components

    let homeProgressView = HomeProgressView()
    let homeIslandView = HomeIslandView()
    let homeWalkView = HomeWalkView()

    // MARK: - Custom Methods

    override func setUI() {
        addSubviews(homeProgressView, homeIslandView, homeWalkView)
    }

    override func setLayout() {
        homeProgressView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(140)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(140)
        }

        homeIslandView.snp.makeConstraints {
            $0.top.equalTo(homeProgressView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(20)
            $0.height.equalTo(180)
        }

        homeWalkView.snp.makeConstraints {
            $0.top.equalTo(homeProgressView.snp.bottom).offset(20)
            $0.leading.equalTo(homeIslandView.snp.trailing).offset(12)
            $0.trailing.equalToSuperview().inset(20)
            $0.width.equalTo(homeIslandView)
            $0.height.equalTo(180)
        }
    }
}
