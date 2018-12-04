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
        let imageURL = URL(string: "https://cdnb.artstation.com/p/assets/images/images/000/066/819/large/tloue32012promo.jpg")!
        self.feedCards = [FeedCard(id: "123",
                                   elements: [.title(text: "Title One"),
                                              .subtitle(text: "Subtitle One"),
                                              .body(text: "Long time ago in a galaxy far far away"),
                                              .image(url: imageURL )
                                    ]),
                          FeedCard(id: "124",
                                   elements: [.title(text: "Title Two"),
                                              .subtitle(text: "Subtitle Two"),
                                              .body(text: "Long time ago in a galaxy far far away")])]
    }
    
}

extension FeedViewModel: FeedViewModelOutput {
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return feedCards.count
    }
    
    func feedCard(forRow row: Int) -> FeedCard {
        return feedCards[row]
    }
}
