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
        patchHome()
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

            homeView.homeProgressView.configure(currentSteps: 50-shakeCount, totalSteps: 50, walkCount: shakeCount)
            homeView.homeWalkView.configure(count: shakeCount)
        }
    }

    deinit {
        motionManager.stopAccelerometerUpdates()
    }
}

extension HomeViewController {
    private func patchHome() {
        HomeService().getHomeStep(userID: 1) { result in
            switch result {
            case .success(let stepInfo):
                self.shakeCount = stepInfo.totalStep

                /// 다음 섬까지 남은 걸음 수 (50 간격)
                let distancePerIsland = 50
                let remainingSteps = distancePerIsland - (self.shakeCount % distancePerIsland)

                print("총 걸음 수: \(self.shakeCount), 섬 수: \(stepInfo.islandCount), 남은 걸음: \(remainingSteps)")


                self.homeView.homeWalkView.configure(count: self.shakeCount)
                self.homeView.homeIslandView.configure(count: stepInfo.islandCount)
//                self.homeView.homeProgressView.configure(
//                    currentSteps: remainingSteps,
//                    totalSteps: distancePerIsland
//                )

            case .requestErr:
                print("요청 에러 (400번대)")
            case .pathErr:
                print("경로 에러 (디코딩 실패)")
            case .serverErr:
                print("서버 내부 에러")
            case .networkFail:
                print("네트워크 연결 실패")
            }
        }
    }
}
