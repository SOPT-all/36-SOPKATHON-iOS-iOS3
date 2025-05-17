//
//  TabbarController.swift
//  36-SOPKATHON-iOS-TEAM-3
//
//  Created by seozero on 5/18/25.
//

import UIKit

final class TabbarController: UITabBarController, UITabBarControllerDelegate {
    
    private enum TabIndex: Int {
        case home
        case map
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        
        configureController()
        setupTabBarAppearance()
    }
    
    private func configureController() {
        let homeViewController = tabBarNavigationController(
            rootViewController: HomeViewController(),
            title: "홈"
        )

        let mapViewController = tabBarNavigationController(
            rootViewController: MapViewController(),
            title: "지도"
        )

        viewControllers = [homeViewController, mapViewController]
        tabBar.tintColor = .black
    }
    
    private func tabBarNavigationController(
        rootViewController: UIViewController,
        title: String
    ) -> UINavigationController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        return navController
    }
    
    private func setupTabBarAppearance() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.white // TODO: 앱 색상으로 변경 예정

        let itemAppearance = UITabBarItemAppearance()
        
        let normalAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 20, weight: .regular),
            .foregroundColor: UIColor.gray
        ]
        let selectedAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 20, weight: .bold),
            .foregroundColor: UIColor.black
        ]
        
        itemAppearance.normal.titleTextAttributes = normalAttributes
        itemAppearance.selected.titleTextAttributes = selectedAttributes
        
        appearance.stackedLayoutAppearance = itemAppearance
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
    }
    
}

#Preview {
    TabbarController()
}
