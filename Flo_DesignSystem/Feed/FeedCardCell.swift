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
    private var textStyleProvider = TextStyleProvider()
    
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
                let title = TitleElement(text: text)
                title.apply(style: textStyleProvider.title)
                return title
            case .subtitle(let text):
                let subtitle = SubtitleElement(text: text)
                subtitle.apply(style: textStyleProvider.subtitle)
                return subtitle
            case .body(let text):
                let body = BodyElement(text: text)
                body.apply(style: textStyleProvider.body)
                return body
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
        rootFlexContainer.subviews.forEach { $0.removeFromSuperview() }
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


struct FeedCardCellStyle {
    let backgroundColor: Color
}

extension FeedCardCell {
    func apply(style: FeedCardCellStyle) {
        self.backgroundColor = style.backgroundColor.uiColor
    }
}

final class FeedCardCellStyleProvider {
    private var theme: Theme {
        return FuckingSigleton.instance.theme
    }
    
    var `default`: FeedCardCellStyle {
        switch theme {
        case .light(let t):
            return FeedCardCellStyle(backgroundColor: t.palette.background)
        case .dark(let t):
            return FeedCardCellStyle(backgroundColor: t.palette.background)
        }
    }
}
