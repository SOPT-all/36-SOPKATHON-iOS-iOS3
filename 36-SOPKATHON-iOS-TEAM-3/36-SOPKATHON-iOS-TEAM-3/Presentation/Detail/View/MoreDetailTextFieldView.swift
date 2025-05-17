//
//  MoreDetailTextFieldView.swift
//  36-SOPKATHON-iOS-TEAM-3
//
//  Created by 김나연 on 5/18/25.
//

import UIKit

class MoreDetailTextFieldView: BaseUIView {
    func getText() -> String {
        return commentTextField.text ?? ""
    }

    func clearText() {
        commentTextField.text = ""
    }

    
    private let commentTextField = UITextField().then{
        $0.backgroundColor = .color14
        let placeholderPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: $0.frame.height))
        $0.leftView = placeholderPaddingView
        $0.leftViewMode = .always
        $0.setPlaceholderColor(.color16)
        $0.placeholder = "유저 코멘트"
        $0.textColor = .color16
        $0.layer.cornerRadius = 21
    }
    
    let sendButton = UIButton().then{
        $0.setImage(.sendIcon, for: .normal)
    }
    
    override func setUI() {
        backgroundColor = .white
        addSubviews(commentTextField,sendButton)
    }
    
    override func setLayout() {
        commentTextField.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(24)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(36)
            $0.width.equalTo(290)
        }
        sendButton.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(24)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(24)
        }
    }
}
