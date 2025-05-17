//
//  DetailViewController.swift
//  36-SOPKATHON-iOS-TEAM-3
//
//  Created by seozero on 5/18/25.
//

import UIKit

import SnapKit
import Then

final class DetailViewController: BaseUIViewController {
    
    var steps: Int = 0
    var category: DetailCategory = .food
    
    private let islandNameLabel = UILabel()
    private let islandLocationLabel = UILabel()
    private let islandDescriptionLabel = UILabel()
    
    // name + location
    private let detailStackView1 = UIStackView()
    // stack1 + description
    private var detailStackView2 = UIStackView()
    
    private var islandMainImageView = UIImageView()
    private let islandSubImageView1 = UIImageView()
    private let islandSubImageView2 = UIImageView()
    
    private let imageHorizontalStackView = UIStackView()
    private let imageStackView = UIStackView()
    // stack2 + image
    private var detailStackView3 = UIStackView()
    
    private let categoryLabel = UILabel()
    private let categoryPaddingView1 = UIView()
    private let categoryPaddingView2 = UIView()
    private let categoryLabelStackView = UIStackView()
    private let categoryDescriptionLabel = UILabel()
    
    private let categoryStackView = UIStackView()
    // stack3 + category
    private var detailTotalStackView = UIStackView()
    
    private let moreDetailButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setStyle()
        setUI()
        setLayout()
        
        patchIslandInfo()
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
        self.navigationItem.hidesBackButton = false
    }
    
    
    private func setStyle() {
        
        view.backgroundColor = .white
        
        islandNameLabel.do {
            $0.text = "퍼플섬"
            $0.textColor = .black
            $0.font = .pretendard(.pretendardSemiBold, size: 32)
        }
        
        islandLocationLabel.do {
            $0.text = "전남 신안군 안좌면 소곡리 599-4"
            $0.textColor = .gray500
            $0.font = .pretendard(.pretendardSemiBold, size: 12)
        }
        
        islandDescriptionLabel.do {
            $0.text = "보랏빛 꽃 향기 맡으며 아름다운 해안 산책로를 걷고 일상의 작은 여유가 있는 섬"
            $0.textColor = .black
            $0.textAlignment = .center
            $0.font = .pretendard(.pretendardMedium, size: 14)
            $0.numberOfLines = 2
        }
        
        imageHorizontalStackView.do {
            $0.axis = .horizontal
            $0.spacing = 10
            $0.distribution = .fill
        }
        
//        islandSubImageView1.do {
//        }
//        
//        islandSubImageView2.do {
//        }
//        
//        islandMainImageView.do {
//        }
        
        imageStackView.do {
            $0.axis = .vertical
            $0.spacing = 8
            $0.distribution = .fill
        }
        
        categoryLabel.do {
            $0.text = category.label
            $0.textColor = .white
            $0.textAlignment = .center
            $0.font = .pretendard(.pretendardSemiBold, size: 12)
            $0.backgroundColor = .orange800
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 12.5
        }
        
        categoryDescriptionLabel.do {
            $0.text = "갯벌 위로 시원한 바람을 맞으며 두 발로 퍼플교를 건너면 박을 엎어 놓은 모양의 박지도와 마주하게 된다."
            $0.textColor = .black
            $0.textAlignment = .center
            $0.font = .pretendard(.pretendardRegular, size: 14)
            $0.numberOfLines = 8
        }
        
        categoryStackView.do {
            $0.axis = .vertical
            $0.spacing = 12
            $0.distribution = .fill
            $0.alignment = .fill
        }
        
        moreDetailButton.do {
            $0.setTitle("상세보기", for: .normal)
            $0.setTitleColor(.orange800, for: .normal)
            $0.backgroundColor = .white
            $0.layer.cornerRadius = 10
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.orange800.cgColor
            $0.addTarget(self, action: #selector(didTapMoreDetailButton), for: .touchUpInside)
        }
        
        [detailStackView1, detailStackView2, detailStackView3].forEach {
            $0.axis = .vertical
            $0.alignment = .center
            $0.distribution = .fill
        }
        
        detailStackView1.spacing = 8
        detailStackView2.spacing = 12
        detailStackView3.spacing = 24
        detailTotalStackView.do {
            $0.axis = .vertical
            $0.alignment = .fill
            $0.distribution = .fill
            $0.spacing = 32
        }
        
    }
    
    override func setUI() {
        view.addSubviews(
            detailTotalStackView,
            moreDetailButton
        )
        
        detailStackView1.addArrangedSubviews(
            islandNameLabel,
            islandLocationLabel
        )
        
        detailStackView2.addArrangedSubviews(
            detailStackView1,
            islandDescriptionLabel
        )
        
        imageHorizontalStackView.addArrangedSubviews(
            islandSubImageView1,
            islandSubImageView2
        )
        
        imageStackView.addArrangedSubviews(
            islandMainImageView,
            imageHorizontalStackView
        )
        
        detailStackView3.addArrangedSubviews(
            detailStackView2,
            imageStackView
        )
        
        categoryLabelStackView.addArrangedSubviews(
            categoryPaddingView1,
            categoryLabel,
            categoryPaddingView2
        )
        
        categoryStackView.addArrangedSubviews(
            categoryLabelStackView,
            categoryDescriptionLabel
        )
        
        detailTotalStackView.addArrangedSubviews(
            detailStackView3,
            categoryStackView
        )

    }
    
    override func setLayout() {
        detailTotalStackView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(58)
            $0.leading.trailing.equalToSuperview().inset(60)
        }
        
        islandMainImageView.snp.makeConstraints {
            $0.width.equalTo(230)
        }
        
        islandSubImageView1.snp.makeConstraints {
            $0.width.equalTo(110)
            $0.height.equalTo(67)
        }
        
        islandSubImageView2.snp.makeConstraints {
            $0.width.equalTo(110)
            $0.height.equalTo(67)
        }
        
        categoryPaddingView1.snp.makeConstraints {
            $0.width.equalTo(94)
        }
        
        categoryPaddingView2.snp.makeConstraints {
            $0.width.equalTo(94)
        }

        categoryLabel.snp.makeConstraints {
            $0.height.equalTo(25)
        }
        
        moreDetailButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(16)
            $0.height.equalTo(51)
            $0.centerX.equalToSuperview()
        }
    }
    
    @objc private func didTapMoreDetailButton() {
        let moreDetailVC = MoreDetailViewController()

        // 예시 데이터 전달 (모델 또는 단일 값 등)
//        moreDetailVC.islandName = islandNameLabel.text
//        moreDetailVC.islandDescription = islandDescriptionLabel.text
//        moreDetailVC.image = islandMainImageView.image // UIImage 전달 예시

        self.navigationController?.pushViewController(moreDetailVC, animated: true)
    }
}

extension DetailViewController {
    private func patchIslandInfo() {
        IslandInfoService().getIslandInfo(steps: steps, category: category.label) { result in
            switch result {
            case .success(let result):
                self.islandNameLabel.text = result.name
                if result.name == "퍼플섬" {
                    self.islandLocationLabel.text = "전남 신안군 안좌면 소곡리 599-4"
                } else {
                    self.islandLocationLabel.text = "전남 고흥군 금산면 대신로 276"
                }
                self.islandDescriptionLabel.text = result.island_description
                
                if result.name == "퍼플섬" {
                    self.islandMainImageView.image = .island11
                    self.islandSubImageView1.image = .island12
                    self.islandSubImageView2.image = .island13
                } else {
                    self.islandMainImageView.image = .island21
                    self.islandSubImageView1.image = .island22
                    self.islandSubImageView2.image = .island23
                }
                
                self.categoryDescriptionLabel.text = result.category_description
                
            case .requestErr:
                print("요청 에러")
            case .pathErr:
                print("디코딩 에러")
            case .serverErr:
                print("서버 에러")
            case .networkFail:
                print("네트워크 오류")
            }
        }
    }

}
