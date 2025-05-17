//
//  AppViewController.swift
//  36-SOPKATHON-iOS-TEAM-3
//
//  Created by 성현주 on 5/18/25.
//

import UIKit

final class AppViewController: BaseUIViewController {

    private let tabbarView = TabbarController()
    private lazy var viewControllers: [UIViewController] = []

    private var selectedIndex = 0 {
        willSet { previousIndex = selectedIndex }
        didSet { updateView() }
    }
    private var previousIndex = 0

    private let containerView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        bindTabAction()
    }

    func setViewControllers(_ viewControllers: [UIViewController]) {
        self.viewControllers = viewControllers
        setupInitialView()
    }

    override func setUI() {
        view.addSubviews(containerView, tabbarView)
    }

    override func setLayout() {
        containerView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(tabbarView.snp.top)
        }

        tabbarView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(90)
        }
    }

    private func bindTabAction() {
        tabbarView.onTabSelected = { [weak self] tab in
            guard let self = self else { return }
            switch tab {
            case .home: self.selectedIndex = 0
            case .map: self.selectedIndex = 1
            }
        }
    }

    private func setupInitialView() {
        for (i, vc) in viewControllers.enumerated() {
            addChild(vc)
            containerView.addSubview(vc.view)
            vc.view.snp.makeConstraints { $0.edges.equalToSuperview() }
            vc.didMove(toParent: self)
            vc.view.isHidden = i != selectedIndex
        }
    }

    private func updateView() {
        viewControllers[previousIndex].view.isHidden = true
        viewControllers[selectedIndex].view.isHidden = false
    }
}
