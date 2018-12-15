//
//  TextStyle.swift
//  Flo_DesignSystem
//
//  Created by Andrei Malyhin on 12/4/18.
//  Copyright © 2018 Andrei Malyhin. All rights reserved.
//

import Foundation

class TextStyleProvider {
    private var theme: Theme {
        return FuckingSigleton.instance.theme
    }
    
    var title: TextStyle {
        switch theme {
        case .light(let t):
            return TextStyle(typography: t.typeface.title, color: t.palette.title)
        case .dark(let t):
            return TextStyle(typography: t.typeface.title, color: t.palette.title)
        }
    }
    
    var subtitle: TextStyle {
        switch theme {
        case .light(let t):
            return TextStyle(typography: t.typeface.subtitle, color: t.palette.subtitle)
        case .dark(let t):
            return TextStyle(typography: t.typeface.subtitle, color: t.palette.subtitle)
        }
    }
    
    var body: TextStyle {
        switch theme {
        case .light(let t):
            return TextStyle(typography: t.typeface.body, color: t.palette.body)
        case .dark(let t):
            return TextStyle(typography: t.typeface.body, color: t.palette.body)
        }
    }
}

struct TextStyle {
    let typography: Typography
    let color: Color
}

extension TitleElement {
    func apply(style: TextStyle) {
        self.textColor = style.color.uiColor
        self.font = style.typography.font
    }
}

extension SubtitleElement {
    func apply(style: TextStyle) {
        self.textColor = style.color.uiColor
        self.font = style.typography.font
    }
}

extension BodyElement {
    func apply(style: TextStyle) {
        self.textColor = style.color.uiColor
        self.font = style.typography.font
    }
}
