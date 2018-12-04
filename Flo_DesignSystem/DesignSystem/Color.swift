//
//  Color.swift
//  Flo_DesignSystem
//
//  Created by Andrei Malyhin on 12/4/18.
//  Copyright © 2018 Andrei Malyhin. All rights reserved.
//

import UIKit

protocol Palette {
    var title: Color { get }
    var subtitle: Color { get }
    var body: Color { get }
    var background: Color { get }
}

struct Color {
    let uiColor: UIColor
}

struct PaletteImpl: Palette {
    let title: Color
    let subtitle: Color
    let body: Color
    let background: Color
    
    static let light: Palette = PaletteImpl(title: Color(uiColor: .black), subtitle: Color(uiColor: .black), body: Color(uiColor: .darkGray), background: Color(uiColor: .white))
    
    static let dark: Palette = PaletteImpl(title: Color(uiColor: .white), subtitle: Color(uiColor: .white), body: Color(uiColor: .lightGray), background: Color(uiColor: .black))
}
