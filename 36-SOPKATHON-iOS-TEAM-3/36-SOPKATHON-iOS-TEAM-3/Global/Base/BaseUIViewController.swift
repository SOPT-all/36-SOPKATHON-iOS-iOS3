//
//  BaseUIViewController.swift
//  36-SOPKATHON-iOS-TEAM-3
//
//  Created by 성현주 on 5/17/25.
//

import UIKit

class BaseUIViewController: UIViewController {

    // MARK: - Properties

    // MARK: - UI Components

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        self.hideKeyboardWhenTappedAround()

        setUI()
        setLayout()
        addTarget()
        setDelegate()

    }

    // MARK: - Custom Method

    func setUI() {}

    func setLayout() {}

    // MARK: - Action Method

    func addTarget() {}

    // MARK: - delegate Method

    func setDelegate() {}
}
