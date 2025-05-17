//
//  HomeDTO.swift
//  36-SOPKATHON-iOS-TEAM-3
//
//  Created by 성현주 on 5/18/25.
//

import Foundation

struct HomeStepResponse: Codable {
    let success: Bool
    let data: StepInfo?
    let error: APIError?
}

struct StepInfo: Codable {
    let totalStep: Int
    let islandCount: Int
}

struct APIError: Codable {
    let code: Int
    let message: String
}
