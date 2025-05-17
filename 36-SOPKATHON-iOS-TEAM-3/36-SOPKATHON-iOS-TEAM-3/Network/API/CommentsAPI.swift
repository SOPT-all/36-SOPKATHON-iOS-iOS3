//
//  CommentsAPI.swift
//  36-SOPKATHON-iOS-TEAM-3
//
//  Created by 성현주 on 5/18/25.
//

import Foundation
import Moya

enum CommentsAPI {
    case getIslandComments(islandId: Int)
}

extension CommentsAPI: BaseTargetType {

    var path: String {
        switch self {
        case .getIslandComments(let islandId):
            return "/islands/comments/\(islandId)" 
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

// MARK: - Service

final class CommentsService {

    private let provider = MoyaProvider<CommentsAPI>(plugins: [MoyaLoggerPlugin()])

    func fetchComments(for islandId: Int, completion: @escaping (NetworkResult<[IslandComment]>) -> Void) {
        provider.request(.getIslandComments(islandId: islandId)) { result in
            switch result {
            case .success(let response):
                do {
                    let decoded = try JSONDecoder().decode(IslandCommentResponse.self, from: response.data)
                    completion(.success(decoded.data.commentList))
                } catch {
                    print("디코딩 에러:", error)
                    completion(.pathErr)
                }

            case .failure:
                completion(.networkFail)
            }
        }
    }
}

