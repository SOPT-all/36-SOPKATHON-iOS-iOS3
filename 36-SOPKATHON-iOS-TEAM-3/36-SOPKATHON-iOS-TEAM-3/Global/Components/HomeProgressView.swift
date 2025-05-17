//
//  HomeProgressView.swift
//  36-SOPKATHON-iOS-TEAM-3
//
//  Created by 성현주 on 5/18/25.
//

import UIKit
import SnapKit

final class HomeProgressView: BaseUIView {

    // MARK: - Properties
    private var currentSteps: Int = 0
    private var totalSteps: Int = 100

    // MARK: - UI Components

    private let containerView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 24
        $0.clipsToBounds = true
    }

    private let descriptionLabel = UILabel().then {
        $0.text = "다음 섬까지"
        $0.font = .systemFont(ofSize: 14, weight: .medium)
        $0.textColor = .black
    }

    private let stepLabel = UILabel().then {
        $0.text = "0"
        $0.font = .boldSystemFont(ofSize: 32)
        $0.textColor = .orange800
    }

    private let stepUnitLabel = UILabel().then {
        $0.text = "걸음"
        $0.font = .boldSystemFont(ofSize: 22)
        $0.textColor = .black
    }

    private let progressBackgroundView = UIView().then {
        $0.backgroundColor = .gray100
        $0.layer.cornerRadius = 5
        $0.clipsToBounds = true
    }

    private let progressBarView = UIView().then {
        $0.backgroundColor = .orange
        $0.layer.cornerRadius = 5
        $0.clipsToBounds = true
    }

    // MARK: - Custom Methods

    override func setUI() {
        addSubview(containerView)
        containerView.addSubviews(descriptionLabel, stepLabel, stepUnitLabel, progressBackgroundView)
        progressBackgroundView.addSubview(progressBarView)
    }

    override func setLayout() {
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        descriptionLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.leading.equalToSuperview().inset(24)
        }

        stepLabel.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(8)
            $0.leading.equalTo(descriptionLabel)
        }

        stepUnitLabel.snp.makeConstraints {
            $0.centerY.equalTo(stepLabel)
            $0.leading.equalTo(stepLabel.snp.trailing).offset(4)
        }

        progressBackgroundView.snp.makeConstraints {
            $0.top.equalTo(stepLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(10)
            $0.bottom.equalToSuperview().inset(24)
        }

        progressBarView.snp.makeConstraints {
            $0.leading.top.bottom.equalToSuperview()
            $0.width.equalTo(0)
            $0.height.equalTo(10)
        }
    }

    // MARK: - Public Method

    func configure(currentSteps: Int, totalSteps: Int = 50, walkCount: Int) {
        self.currentSteps = currentSteps
        self.totalSteps = totalSteps

        stepLabel.text = "\(currentSteps)"

        let progressRatio = CGFloat(min(max(walkCount, 0), totalSteps)) / CGFloat(totalSteps)
        let fullWidth = progressBackgroundView.frame.width

        progressBarView.snp.remakeConstraints {
            $0.leading.top.bottom.equalToSuperview()
            $0.width.equalTo(fullWidth * progressRatio)
        }
        layoutIfNeeded()
    }
}
