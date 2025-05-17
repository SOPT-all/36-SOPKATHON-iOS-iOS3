//
//  HomeIslandView.swift
//  36-SOPKATHON-iOS-TEAM-3
//
//  Created by 성현주 on 5/18/25.
//

import UIKit
import SnapKit
import Then

final class HomeIslandView: UIView {

    // MARK: - UI Components

    private let containerView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 24
        $0.clipsToBounds = true
    }

    private let titleLabel = UILabel().then {
        $0.text = "내가\n발견한 섬"
        $0.numberOfLines = 2
        $0.font = .systemFont(ofSize: 18, weight: .semibold)
        $0.textColor = .black
    }

    private let countLabel = UILabel().then {
        $0.text = "0개"
        $0.font = .boldSystemFont(ofSize: 32)
        $0.textColor = .orange800
        $0.textAlignment = .right
    }

    // MARK: - Initializer

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UI Setup

    private func setUI() {
        addSubview(containerView)
        containerView.addSubviews(titleLabel, countLabel)
    }

    private func setLayout() {
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(16)
        }

        countLabel.snp.makeConstraints {
            $0.trailing.bottom.equalToSuperview().inset(16)
        }
    }

    // MARK: - Public Method

    func configure(count: Int) {
        countLabel.text = "\(count)개"
    }
}
