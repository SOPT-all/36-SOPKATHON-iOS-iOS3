//
//  HomeAPI.swift
//  36-SOPKATHON-iOS-TEAM-3
//
//  Created by 성현주 on 5/17/25.
//

//import Foundation
//import Moya
//
//enum HomeAPI {
//    case getHomeStep(userID: Int)
//}
//
//extension HomeAPI: BaseTargetType {
//
//    var path: String {
//        switch self {
//        case .getHomeStep:
//            return "/islands/steps"
//        }
//    }
//
//    var method: Moya.Method {
//        switch self {
//        case .getHomeStep:
//            return .get
//        }
//    }
//
//
//    var task: Task {
//        switch self {
//        case .getHomeStep(let userID):
//            return .requestParameters(parameters: ["userId": userID], encoding: URLEncoding.queryString)
//        }
//    }
//
//    var headers: [String : String]? {
//        return ["Content-Type": "application/json"]
//    }
//}



import Foundation
import Moya

enum HomeAPI {
    case getHomeStep(userID: Int)
}

extension HomeAPI: BaseTargetType {

    var path: String {
        switch self {
        case .getHomeStep(let userID):
            return "/islands/steps/\(userID)" 
        }
    }

    var method: Moya.Method {
        return .get
    }

    var task: Task {
        return .requestPlain
    }

    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}



final class HomeService {

    private let provider = MoyaProvider<HomeAPI>(plugins: [MoyaLoggerPlugin()])

    func getHomeStep(userID: Int, completion: @escaping (NetworkResult<StepInfo>) -> Void) {
        provider.request(.getHomeStep(userID: userID)) { result in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                let decoder = JSONDecoder()

                do {
                    let decoded = try decoder.decode(HomeStepResponse.self, from: data)

                    guard decoded.success, let stepData = decoded.data else {
                        let message = decoded.error?.message ?? "알 수 없는 오류 발생"
                        completion(.requestErr(StepInfo(totalStep: 0, islandCount: 0)))
                        print("API 실패nnnbbb ㅠㅠㅠㅠ: \(message)")
                        return
                    }

                    completion(.success(stepData))

                } catch {
                    completion(.pathErr)
                }

            case .failure:
                completion(.networkFail)
            }
        }
    }
}
