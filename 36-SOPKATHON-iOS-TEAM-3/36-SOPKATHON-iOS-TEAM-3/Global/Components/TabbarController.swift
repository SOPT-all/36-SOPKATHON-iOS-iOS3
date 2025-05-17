//
//  TabbarController.swift
//  36-SOPKATHON-iOS-TEAM-3
//
//  Created by seozero on 5/18/25.
//

import UIKit

import SnapKit
import Then

final class TabbarController: UIView {
    
    enum Tab {
        case home
        case map
    }
    
    var onTabSelected: ((Tab) -> Void)?
    
    private let tabbarView = UIView()
    private let tabbarStackView = UIStackView()
    
    private let homeButton = UIButton()
    private let mapButton = UIButton()
    
    private let divider = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .black
        
        setStyle()
        setUI()
        setLayout()
        addTarget()
        selectTab(.home)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        tabbarView.do {
            $0.backgroundColor = .white
            $0.layer.cornerRadius = 31.5
        }
        
        tabbarStackView.do {
            $0.axis = .horizontal
            $0.spacing = 70
            $0.distribution = .fillProportionally
        }
        
        homeButton.do {
            var configuration = UIButton.Configuration.plain()
            
            configuration.image = .homeIcon
                .resize(targetSize: CGSize(width: 24, height: 24))
                .withRenderingMode(.alwaysTemplate)
            configuration.imagePadding = 2
            configuration.imagePlacement = .top
            configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
            let title = AttributedString("홈", attributes: AttributeContainer([
                .font: UIFont.systemFont(ofSize: 12, weight: .semibold)
            ]))
            configuration.attributedTitle = title
            
            $0.configuration = configuration
            $0.tintColor = .gray

        }
        
        divider.do {
            $0.backgroundColor = .lightGray
        }
        
        mapButton.do {
            var configuration = UIButton.Configuration.plain()
            configuration.image = .mapIcon
                .resize(targetSize: CGSize(width: 24, height: 24))
                .withRenderingMode(.alwaysTemplate)
            configuration.imagePadding = 2
            configuration.imagePlacement = .top
            configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
            let title = AttributedString("도감", attributes: AttributeContainer([
                .font: UIFont.systemFont(ofSize: 12, weight: .semibold)
            ]))
            configuration.attributedTitle = title
            
            $0.configuration = configuration
            $0.tintColor = .gray
        }
    }
    
    private func setUI() {
        self.addSubviews(tabbarView)
        tabbarView.addSubviews(tabbarStackView)
        tabbarStackView.addArrangedSubviews(homeButton, divider, mapButton)
    }
    
    private func setLayout() {
        tabbarView.snp.makeConstraints {
            $0.height.equalTo(63)
            $0.leading.equalToSuperview().inset(24)
            $0.trailing.equalToSuperview().inset(24)
        }
        
        tabbarStackView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(9)
            $0.centerX.equalToSuperview()
        }
        
        divider.snp.makeConstraints {
            $0.width.equalTo(1)
        }
    }
    
    private func addTarget() {
        homeButton.addTarget(self, action: #selector(homeTapped), for: .touchUpInside)
        mapButton.addTarget(self, action: #selector(mapTapped), for: .touchUpInside)
    }
    
    private func selectTab(_ tab: Tab) {
        homeButton.tintColor = tab == .home ? .orange : .gray
        mapButton.tintColor = tab == .map ? .orange : .gray
    }
    
    @objc private func homeTapped() {
        selectTab(.home)
        onTabSelected?(.home)
    }
    
    @objc private func mapTapped() {
        selectTab(.map)
        onTabSelected?(.map)
    }
    
}

#Preview {
    TabbarController()
}
