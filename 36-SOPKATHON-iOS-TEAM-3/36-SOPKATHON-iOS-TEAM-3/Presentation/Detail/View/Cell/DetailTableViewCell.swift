//
//  DetailTableViewCell.swift
//  36-SOPKATHON-iOS-TEAM-3
//
//  Created by 김나연 on 5/18/25.
//

import UIKit
import SnapKit

final class DetailTableViewCell: UITableViewCell {
    
    private let commentLabel = UILabel().then{
        $0.textColor = .black
        $0.numberOfLines = 0
        $0.font = .pretendard(.pretendardMedium, size: 12)
    }
    private let commentContentView = UIView().then{
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        selectionStyle = .none
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        contentView.addSubview(commentContentView)
        commentContentView.addSubview(commentLabel)
        commentLabel.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.bottom.equalToSuperview().inset(13)
        }
        commentContentView.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.top.bottom.equalToSuperview().inset(6)
        }
    }
}
extension DetailTableViewCell {
    func dataBind(_ data: DetailModel) {
        commentLabel.text = data.comment
    }
}
