//
//  FuckingSingleton.swift
//  Flo_DesignSystem
//
//  Created by Andrei Malyhin on 12/4/18.
//  Copyright © 2018 Andrei Malyhin. All rights reserved.
//

import Foundation

final class FuckingSigleton {
    static let instance = FuckingSigleton()
    private var currentTheme: Theme = .light(theme: AppThemeImpl.light)
    
    var theme: Theme {
        return currentTheme
    }
    
    func toggle() {
        if case .light = currentTheme {
            currentTheme = .dark(theme: AppThemeImpl.dark)
        } else {
            currentTheme = .light(theme: AppThemeImpl.light)
        }
    }
}
