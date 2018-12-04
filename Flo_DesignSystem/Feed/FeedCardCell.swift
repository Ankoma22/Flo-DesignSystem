//
//  FeedCardCell.swift
//  Flo_DesignSystem
//
//  Created by Andrei Malyhin on 12/4/18.
//  Copyright © 2018 Andrei Malyhin. All rights reserved.
//

import UIKit
import FlexLayout

final class FeedCardCell: UITableViewCell {
    
    private var elems = [UIView]()
    
    func set(feedCard: FeedCard) {
        elems = feedCard.elements.map { element in
            switch element {
            case .title(let text):
                return TitleElement(text: text)
//            case .subtitle(let text):
//                return SubtitleElement(text: text)
//            case .body(let text):
//                return BodyElement(text: text)
            }
        }
        elems.forEach {
            addSubview($0)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if let f = elems.first {
            
            f.frame = bounds
        }
    }
}
