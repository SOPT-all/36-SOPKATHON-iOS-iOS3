//
//  MoreDetailViewController.swift
//  36-SOPKATHON-iOS-TEAM-3
//
//  Created by 김나연 on 5/18/25.
//

import UIKit
import SnapKit

class MoreDetailViewController: BaseUIViewController {
    private var textFieldViewBottomConstraint: Constraint?

    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let textFieldView = MoreDetailTextFieldView()
    private let spaceView = UIView().then{
        $0.backgroundColor = .white
    }
    private let typeContentView = UIView().then{
        $0.backgroundColor = .orange800
        $0.layer.cornerRadius = 12.5
    }
    private let typeLabel = UILabel().then{
        $0.textColor = .white
        $0.font = .pretendard(.pretendardSemiBold, size: 12)
        $0.text = "관광"
    }
    private let islandLabel = UILabel().then{
        $0.textColor = .black
        $0.font = .pretendard(.pretendardSemiBold, size: 32)
        $0.text = "퍼플섬"
    }
    private let detailContentView = UIView().then{
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 16
    }
    private let detailLabel = UILabel().then{
        $0.numberOfLines = 0
        $0.text = """
            "라벤더 꽃망울 톡 박지도"

            갯벌 위로 시원한 바람을 맞으며 두 발로 퍼플교를 건너면 박을 엮어 놓은 모양의 박지도와 마주하게 된다.

            해안산책로를 따라 거닐거나 자전거를 빌려 섬 한 바퀴를 돌며 만나는 보랏빛 나무와 꽃, 하물며 10여 가구 지붕들로 인해 보랏빛 향기 속에서 포근함을 느낄 수 있다.

            혹시 조금 더 느린 여행을 원한다면 섬마을호텔과 섬마을밥상을 이용하면서 섬을 천천히 음미하는 것도 하나의 팁이다.
            """
        $0.font = .pretendard(.pretendardRegular, size: 16)
        $0.textColor = .black
    }
    
    // MARK: - Custom Method

    override func setUI() {
//        view.backgroundColor = .cyan
        view.addSubviews(scrollView, textFieldView, spaceView)
        scrollView.addSubviews(contentView)
        contentView.addSubviews(
            typeContentView,
            islandLabel,
            detailContentView
        )
        typeContentView.addSubview(typeLabel)
        detailContentView.addSubview(detailLabel)
    }

    override func setLayout() {
        scrollView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(textFieldView.snp.top)
        }
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }
        typeContentView.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(24)
            $0.height.equalTo(25)
            $0.width.equalTo(37)
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(62)
        }
        typeLabel.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(8)
            $0.top.bottom.equalToSuperview().inset(4)
        }
        islandLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(24)
            $0.top.equalTo(typeContentView.snp.bottom).offset(16)
        }
        detailContentView.snp.makeConstraints{
            $0.top.equalTo(islandLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(24)
        }
        detailLabel.snp.makeConstraints{
            $0.top.bottom.equalToSuperview().inset(24)
            $0.leading.equalToSuperview().inset(17)
            $0.trailing.equalToSuperview().inset(24)
        }
        
        textFieldView.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(58)
            self.textFieldViewBottomConstraint = $0.bottom.equalTo(spaceView.snp.top).constraint
        }
        spaceView.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(34)
            $0.bottom.equalToSuperview()
        }
    }

    // MARK: - Action Method

    override func addTarget() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    // MARK: - delegate Method

    override func setDelegate() {}
    
    @objc func keyboardWillShow(_ notification: Notification) {
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect,
              let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else { return }

        let keyboardHeight = keyboardFrame.height

        textFieldViewBottomConstraint?.update(offset: -keyboardHeight)

        UIView.animate(withDuration: duration) {
            self.view.layoutIfNeeded()
        }
    }

    @objc func keyboardWillHide(_ notification: Notification) {
        guard let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else { return }

        textFieldViewBottomConstraint?.update(offset: 0)

        UIView.animate(withDuration: duration) {
            self.view.layoutIfNeeded()
        }
    }
}
