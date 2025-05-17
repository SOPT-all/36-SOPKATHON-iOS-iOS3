//
//  HomeViewController.swift
//  36-SOPKATHON-iOS-TEAM-3
//
//  Created by 김나연 on 5/17/25.
//
import UIKit
import CoreMotion

final class HomeViewController: BaseUIViewController {

    // MARK: - Properties

    private let motionManager = CMMotionManager()
    private var shakeCount = 0

    // MARK: - UI Components

    let homeView = HomeView()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        startWalking()
    }


    // MARK: - Custom Methods

    override func setUI() {
        view.addSubview(homeView)
    }

    override func setLayout() {
        homeView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }

    // MARK: - Private Methods

    private func startWalking() {
        guard motionManager.isAccelerometerAvailable else {
            return
        }

        motionManager.accelerometerUpdateInterval = 0.1

        motionManager.startAccelerometerUpdates(to: .main) { [weak self] data, _ in
            guard let self = self, let accel = data?.acceleration else { return }

            let totalAcceleration = sqrt(
                accel.x * accel.x +
                accel.y * accel.y +
                accel.z * accel.z
            )

            if totalAcceleration > 1.5 {
                self.shakeCount += 1
                print("흔들림 감지됨: \(self.shakeCount)")
            }

            homeView.homeProgressView.configure(currentSteps: shakeCount, totalSteps: 100)
            homeView.homeWalkView.configure(count: shakeCount)
        }
    }

    deinit {
        motionManager.stopAccelerometerUpdates()
    }
}
