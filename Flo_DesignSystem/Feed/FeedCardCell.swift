//
//  FeedCardCell.swift
//  Flo_DesignSystem
//
//  Created by Andrei Malyhin on 12/4/18.
//  Copyright © 2018 Andrei Malyhin. All rights reserved.
//

import UIKit
import FlexLayout
import PinLayout

final class FeedCardCell: UITableViewCell {
    
    private let rootFlexContainer = UIView()
    private var elems = [UIView]()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(rootFlexContainer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(feedCard: FeedCard) {
        elems = feedCard.elements.map { element in
            switch element {
            case .title(let text):
                return TitleElement(text: text)
            case .subtitle(let text):
                return SubtitleElement(text: text)
            case .body(let text):
                return BodyElement(text: text)
            case .image(let url):
                return ImageElement(url: url)
            }
        }
        rootFlexContainer.flex.direction(.column).padding(12).define { flex in
            elems.forEach { elem in
                if let imageView = elem as? ImageElement {
                    flex.addItem(elem).height(250).aspectRatio(of: imageView)
                } else {
                    flex.addItem(elem)
                }
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        rootFlexContainer.removeFromSuperview()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
    
    private func layout() {
        rootFlexContainer.pin.all()
        rootFlexContainer.flex.layout(mode: .adjustHeight)
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        contentView.pin.width(size.width)
        layout()
        return CGSize(width: contentView.frame.width, height: rootFlexContainer.frame.maxY)
    }
}
