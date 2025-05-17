
//
//  Untitled.swift
//  36-SOPKATHON-iOS-TEAM-3
//
//  Created by 김나연 on 5/18/25.
//
import UIKit

class DetailTableView: UIView {
    private let titleLabel = UILabel().then{
        $0.text = "유저 코멘트"
        $0.font = .pretendard(.pretendardMedium, size: 16)
        $0.textColor = .black
    }
    
    private let tableView = UITableView().then {
        $0.separatorStyle = .none
        $0.backgroundColor = .clear
        $0.showsVerticalScrollIndicator = false
    }
    private let chatList = DetailModel.dummy()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
        setDelegate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setUI() {
        backgroundColor = .clear
        addSubviews(titleLabel, tableView)
        tableView.register(DetailTableViewCell.self, forCellReuseIdentifier: "DetailTableViewCell")
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(24)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(6)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(36)
        }
    }
    
    private func setDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension DetailTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailTableViewCell", for: indexPath) as? DetailTableViewCell else {
            return UITableViewCell()
        }
        cell.dataBind(chatList[indexPath.row])
        return cell
    }
}
