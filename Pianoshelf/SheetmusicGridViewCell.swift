//
//  SheetmusicGridViewCell.swift
//  Pianoshelf
//
//  Created by Winston Wu on 2014-11-23.
//  Copyright (c) 2014 pianoshelf. All rights reserved.
//

import UIKit

class SheetmusicGridViewCell: UICollectionViewCell, UIGestureRecognizerDelegate {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    let textLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.userInteractionEnabled = true
    }
    
}
