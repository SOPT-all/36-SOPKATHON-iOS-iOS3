//
//  MapViewController.swift
//  36-SOPKATHON-iOS-TEAM-3
//
//  Created by 안치욱 on 5/18/25.
//

import UIKit
import SnapKit
import Then

final class MapViewController: BaseUIViewController {
    
    private let mapView = MapView()
    
    private let popUpView = CustomPopUpView().then {
        $0.layer.cornerRadius = 17
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func setUI() {
        view.backgroundColor = .gray100
        view.addSubviews(
            mapView
        )
    }
    
    override func setLayout() {
        mapView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(24)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(612)
        }
    }
    
}
