//
//  FeedEntities.swift
//  Flo_DesignSystem
//
//  Created by Andrei Malyhin on 12/4/18.
//  Copyright © 2018 Andrei Malyhin. All rights reserved.
//

import Foundation

typealias FeedCardId = String

struct FeedCard {
    let id: FeedCardId
    let elements: [FeedCardElement]
}

enum FeedCardElement {
    case title(text: String)
//    case subtitle(text: String)
//    case body(text: String)
//    case image(url: URL)
//    case button(title: String)
}
