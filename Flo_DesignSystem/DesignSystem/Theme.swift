//
//  Theme.swift
//  Flo_DesignSystem
//
//  Created by Andrei Malyhin on 12/4/18.
//  Copyright © 2018 Andrei Malyhin. All rights reserved.
//

import Foundation

enum Theme {
    case light(theme: AppTheme)
    case dark(theme: AppTheme)
}

protocol AppTheme {
    var palette: Palette { get }
    var typeface: Typeface { get }
}

struct AppThemeImpl: AppTheme {
    let palette: Palette
    let typeface: Typeface
    
    static let light: AppTheme = AppThemeImpl(palette: PaletteImpl.light, typeface: TypefaceImpl.regular)
    static let dark: AppTheme = AppThemeImpl(palette: PaletteImpl.dark, typeface: TypefaceImpl.regular)
}
