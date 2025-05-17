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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func setUI() {
        view.backgroundColor = .blue100
        view.addSubviews(
            mapView
        )
    }
    
    override func setLayout() {
        mapView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(78)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(142)
        }
    }
    
}
