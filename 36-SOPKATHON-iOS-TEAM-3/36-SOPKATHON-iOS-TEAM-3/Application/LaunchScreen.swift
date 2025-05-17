//
//  LaunchScreen.swift
//  36-SOPKATHON-iOS-TEAM-3
//
//  Created by seozero on 5/18/25.
//

import UIKit

final class LaunchScreen: UIViewController {
    
    // MARK: - UI Properties
    
    private lazy var logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        
        imageView.image = .launchLogo
        
        return imageView
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setUI()
        setLayout()
    }
    
}

// MARK: - Extensions

extension LaunchScreen {
    private func setUI() {
        view.backgroundColor = .orange800
        
        view.addSubview(logoImage)
    }
    
    private func setLayout() {
        logoImage.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.5)
        }
    }
}
