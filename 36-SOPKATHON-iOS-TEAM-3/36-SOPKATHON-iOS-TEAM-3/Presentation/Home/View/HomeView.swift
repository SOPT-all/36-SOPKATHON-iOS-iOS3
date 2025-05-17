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

    let logoView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        $0.image = UIImage(named: "logo")
    }

    let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        $0.image = UIImage(named: "isLand")
    }

    let homeProgressView = HomeProgressView()
    let homeIslandView = HomeIslandView()
    let homeWalkView = HomeWalkView()

    // MARK: - Custom Methods

    override func setUI() {
        addSubviews(logoView, imageView, homeProgressView, homeIslandView, homeWalkView)
    }

    override func setLayout() {
        logoView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(16)
            $0.leading.equalToSuperview().inset(24)
            $0.width.equalTo(82)
            $0.height.equalTo(16)
        }


        imageView.snp.makeConstraints {
            $0.top.equalTo(logoView.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(278)
            $0.height.equalTo(235)
        }

        homeProgressView.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(118)
        }

        homeIslandView.snp.makeConstraints {
            $0.top.equalTo(homeProgressView.snp.bottom).offset(8)
            $0.leading.equalToSuperview().inset(24)
            $0.height.equalTo(180)
        }

        homeWalkView.snp.makeConstraints {
            $0.top.equalTo(homeProgressView.snp.bottom).offset(8)
            $0.leading.equalTo(homeIslandView.snp.trailing).offset(8)
            $0.trailing.equalToSuperview().inset(24)
            $0.width.equalTo(homeIslandView)
            $0.height.equalTo(180)
        }
    }
}
