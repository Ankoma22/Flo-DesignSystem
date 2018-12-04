//
//  ImageElement.swift
//  Flo_DesignSystem
//
//  Created by Andrei Malyhin on 12/4/18.
//  Copyright © 2018 Andrei Malyhin. All rights reserved.
//

import UIKit
import Kingfisher

final class ImageElement: UIImageView {
    init(url: URL) {
        super.init(frame: .zero)
        
        kf.setImage(with: url)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
