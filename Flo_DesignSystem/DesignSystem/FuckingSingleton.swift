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
    
    var theme: Theme {
        return .light(theme: AppThemeImpl.light)
    }
}
