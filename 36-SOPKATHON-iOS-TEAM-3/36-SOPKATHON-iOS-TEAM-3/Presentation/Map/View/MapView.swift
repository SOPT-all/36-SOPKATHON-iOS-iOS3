//
//  MapView.swift
//  36-SOPKATHON-iOS-TEAM-3
//
//  Created by 안치욱 on 5/18/25.
//

import UIKit
import SnapKit
import Then

final class MapView: BaseUIView {
    
    private let mapImageView = UIImageView().then {
        $0.image = .map
    }
    
    override func setUI() {
        self.addSubviews(mapImageView)
    }
    
    override func setLayout() {
        mapImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
}
