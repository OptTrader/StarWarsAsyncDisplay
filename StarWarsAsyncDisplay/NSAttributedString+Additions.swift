//
//  NSAttributedString+Additions.swift
//  StarWarsAsyncDisplay
//
//  Created by Chris Kong on 3/1/17.
//  Copyright © 2017 Chris Kong. All rights reserved.
//

import UIKit

extension String {
    
    func attributedString(fontSize: CGFloat, color: UIColor) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        
        let attributes = [NSForegroundColorAttributeName: color, NSFontAttributeName: UIFont.systemFont(ofSize: fontSize)]
        attributedString.addAttributes(attributes, range: NSMakeRange(0, self.characters.count))
        
        return attributedString
    }
}

