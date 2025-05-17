//
//  DetailCategory.swift
//  36-SOPKATHON-iOS-TEAM-3
//
//  Created by seozero on 5/18/25.
//

enum DetailCategory: Int {
    case food
    case culture
    case tour
    
    var label: String {
        switch self {
        case .food:
            "음식"
        case .culture:
            "문화"
        case .tour:
            "관광"
        }
    }
}
