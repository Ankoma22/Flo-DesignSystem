//
//  Typography.swift
//  Flo_DesignSystem
//
//  Created by Andrei Malyhin on 12/4/18.
//  Copyright © 2018 Andrei Malyhin. All rights reserved.
//

import UIKit

protocol Typeface {
    var title: Typography { get }
    var subtitle: Typography { get }
    var body: Typography { get }
}

struct Typography {
    let font: UIFont
}

struct TypefaceImpl: Typeface {
    let title: Typography
    let subtitle: Typography
    let body: Typography
    
    static let regular: Typeface = TypefaceImpl(title: Typography(font: UIFont.boldSystemFont(ofSize: 32)),
                                              subtitle: Typography(font: UIFont.systemFont(ofSize: 24)),
                                              body: Typography(font: UIFont.systemFont(ofSize: 18)))
}
