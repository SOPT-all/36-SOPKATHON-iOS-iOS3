//
//  MoreDetailViewController.swift
//  36-SOPKATHON-iOS-TEAM-3
//
//  Created by 김나연 on 5/18/25.
//

import UIKit
import SnapKit

final class MoreDetailViewController: BaseUIViewController {
    // MARK: - UI Components

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
//    private let chatList = DetailModel.dummy()
    private var comments: [DetailModel] = []
    private let commentsService = CommentsService()
    private let islandId = 1
    
    private func fetchComments() {
        commentsService.fetchComments(for: islandId) { [weak self] result in
            switch result {
            case .success(let islandComments):
                let detailModels = islandComments.map { DetailModel(from: $0) }
                self?.comments = detailModels
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .pathErr:
                print("경로 에러")
            case .networkFail:
                print("네트워크 실패")
            default:
                break
            }
        }
    }

    private let textFieldView = MoreDetailTextFieldView()
    private var textFieldBottomConstraint: Constraint?


    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableHeaderView()
        fetchComments()
    }

    // MARK: - Base Methods

    override func setUI() {
        view.addSubviews(tableView, textFieldView, spaceView)
        tableView.register(DetailTableViewCell.self,
                           forCellReuseIdentifier: DetailTableViewCell.identifier)
    }

    override func setLayout() {
        tableView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalTo(textFieldView.snp.top)
        }

        textFieldView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(58)
            textFieldBottomConstraint = $0.bottom.equalTo(view.safeAreaLayoutGuide).constraint
        }
        spaceView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.height.equalTo(34)
        }
    }

    override func setDelegate() {
        tableView.dataSource = self
        tableView.delegate   = self
    }

    override func addTarget() {
        textFieldView.sendButton.addTarget(self, action: #selector(didTapSend), for: .touchUpInside)

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow(_:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide(_:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }

    // MARK: - Header 구성

    private func configureTableHeaderView() {
        let header = UIView()
        header.backgroundColor = .gray100

        header.addSubviews(
            typeContentView,
            islandLabel,
            detailContentView
        )
        typeContentView.addSubview(typeLabel)
        detailContentView.addSubview(detailLabel)

        typeContentView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().inset(24)
            $0.size.equalTo(CGSize(width: 37, height: 25))
        }
        typeLabel.snp.makeConstraints { $0.edges.equalToSuperview().inset(4) }

        islandLabel.snp.makeConstraints {
            $0.top.equalTo(typeContentView.snp.bottom).offset(16)
            $0.leading.equalToSuperview().inset(24)
        }

        detailContentView.snp.makeConstraints {
            $0.top.equalTo(islandLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.bottom.equalToSuperview().inset(20)
        }
        detailLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(UIEdgeInsets(top:24, left:17, bottom:24, right:24))
        }

        let targetWidth = UIScreen.main.bounds.width
        let fittingSize = header.systemLayoutSizeFitting(
            CGSize(width: targetWidth, height: UIView.layoutFittingCompressedSize.height),
            withHorizontalFittingPriority: .required,
            verticalFittingPriority: .fittingSizeLevel
        )
        header.frame = CGRect(origin: .zero, size: fittingSize)
        tableView.tableHeaderView = header
    }

    // MARK: - Keyboard Handling

    @objc private func keyboardWillShow(_ n: Notification) {
        guard
            let frame = n.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect,
            let duration = n.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double
        else { return }

        textFieldBottomConstraint?.update(offset: -frame.height + 34)
        UIView.animate(withDuration: duration) {
            self.view.layoutIfNeeded()
        }
    }

    @objc private func keyboardWillHide(_ n: Notification) {
        guard let duration = n.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double
        else { return }

        textFieldBottomConstraint?.update(offset: 0)
        UIView.animate(withDuration: duration) {
            self.view.layoutIfNeeded()
        }
    }

    // MARK: - 재사용할 Header UI (이전 코드 그대로)

    private let typeContentView = UIView().then {
        $0.backgroundColor = .orange800
        $0.layer.cornerRadius = 12.5
    }
    private let typeLabel = UILabel().then {
        $0.text = "관광"
        $0.font = .pretendard(.pretendardSemiBold, size: 12)
        $0.textColor = .white
    }
    private let islandLabel = UILabel().then {
        $0.text = "퍼플섬"
        $0.font = .pretendard(.pretendardSemiBold, size: 32)
        $0.textColor = .black
    }
    private let detailContentView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 16
    }
    private let detailLabel = UILabel().then {
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
    private let spaceView = UIView().then {
        $0.backgroundColor = .white
    }
    @objc private func didTapSend() {
        let text = textFieldView.getText().trimmingCharacters(in: .whitespacesAndNewlines)
        guard !text.isEmpty else { return }

        let request = PostCommentRequest(comment: text)

        commentsService.postComment(islandId: islandId, request: request) { [weak self] result in
            switch result {
            case .success:
                self?.fetchComments()
                DispatchQueue.main.async {
                    self?.textFieldView.clearText()
                }
            case .requestErr:
                print("요청 에러")
            case .pathErr:
                print("디코딩 실패")
            case .serverErr:
                print("서버 에러")
            case .networkFail:
                print("네트워크 오류")
            }
        }
    }

}

// MARK: - UITableViewDataSource & Delegate

extension MoreDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tv: UITableView, numberOfRowsInSection s: Int) -> Int {
        return comments.count
    }
    func tableView(_ tv: UITableView,
                   cellForRowAt ip: IndexPath) -> UITableViewCell {
        let cell = tv.dequeueReusableCell(
            withIdentifier: DetailTableViewCell.identifier,
            for: ip
        ) as! DetailTableViewCell
        cell.dataBind(comments[ip.row])
        return cell
    }
}
