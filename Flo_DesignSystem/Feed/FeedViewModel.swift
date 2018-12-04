//
//  FeedViewModel.swift
//  Flo_DesignSystem
//
//  Created by Andrei Malyhin on 12/4/18.
//  Copyright © 2018 Andrei Malyhin. All rights reserved.
//

import Foundation

protocol FeedViewModelOutput {
    func numberOfSections() -> Int
    func numberOfRowsInSection(_ section: Int) -> Int
    func feedCard(forRow row: Int) -> FeedCard
}

final class FeedViewModel {
    
    private let feedCards: [FeedCard]
    
    init() {
        self.feedCards = [FeedCard(id: "123", elements: [.title(text: "Test1")])]
    }
    
}

extension FeedViewModel: FeedViewModelOutput {
    func numberOfSections() -> Int {
        return feedCards.count
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return feedCards[section].elements.count
    }
    
    func feedCard(forRow row: Int) -> FeedCard {
        return feedCards[row]
    }
}
