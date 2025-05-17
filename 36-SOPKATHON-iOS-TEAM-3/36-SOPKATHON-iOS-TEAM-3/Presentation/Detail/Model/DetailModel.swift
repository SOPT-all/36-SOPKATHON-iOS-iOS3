//
//  Untitled.swift
//  36-SOPKATHON-iOS-TEAM-3
//
//  Created by 김나연 on 5/18/25.
//

import UIKit

struct DetailModel {
    let comment: String
    init(from islandComment: IslandComment) {
        self.comment = islandComment.comment ?? ""
    }
}
//extension DetailModel {
//    static func dummy() -> [DetailModel] {
//        return [
//            DetailModel(comment: "흥미롭네요"),
//            DetailModel(comment: "흥미롭네요"),
//            DetailModel(comment: "흥미롭네요"),
//            DetailModel(comment: "흥미롭네요"),
//            DetailModel(comment: "흥미롭네요")
//        ]
//    }
//}
