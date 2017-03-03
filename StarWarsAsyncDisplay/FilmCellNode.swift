//
//  FilmCellNode.swift
//  StarWarsAsyncDisplay
//
//  Created by Chris Kong on 3/1/17.
//  Copyright © 2017 Chris Kong. All rights reserved.
//

import AsyncDisplayKit

fileprivate let TitleFontSize: CGFloat = 16
fileprivate let SmallFontSize: CGFloat = 12
fileprivate let BackgroundImageSize: CGFloat = 30
fileprivate let HorizontalBuffer: CGFloat = 10

class FilmCellNode: ASCellNode {
    fileprivate var _filmTitleLabel: ASTextNode!
    fileprivate var _filmOpeningCrawlLabel: ASTextNode!
    fileprivate var _backgroundImageView: ASImageNode!
    
    init(film: Film) {
        super.init()
        
        backgroundColor = .clear
        
        _backgroundImageView = ASImageNode()
        _backgroundImageView.image = UIImage(named: "sw5.jpg")
        _backgroundImageView.willDisplayNodeContentWithRenderingContext = { context in
            let bounds = context.boundingBoxOfClipPath
            UIBezierPath(roundedRect: bounds, cornerRadius: 10).addClip()
        }
        
        _filmTitleLabel = createLayerBackedTextNode(attributedString: film.title.attributedString(fontSize: TitleFontSize, color: UIColor.white))
        
        
        _filmOpeningCrawlLabel = createLayerBackedTextNode(attributedString: film.openingCrawl.attributedString(fontSize: SmallFontSize, color: UIColor.black))

        automaticallyManagesSubnodes = true
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        let photoDimension: CGFloat = constrainedSize.max.width / 2.0
        _backgroundImageView.style.preferredSize = CGSize(width: photoDimension, height: photoDimension)
        
        // INFINITY is used to make the inset unbounded
        let insets = UIEdgeInsets(top: CGFloat.infinity, left: 12, bottom: 12, right: 12)
        let textInsetSpec = ASInsetLayoutSpec(insets: insets, child: _filmTitleLabel)
        
        let overlayLayout = ASOverlayLayoutSpec(child: _backgroundImageView, overlay: textInsetSpec)
        
//        return ASOverlayLayoutSpec(child: _backgroundImageView, overlay: textInsetSpec)
        
        let verticalStackLayoutSpec = ASStackLayoutSpec.vertical()
        verticalStackLayoutSpec.alignItems = ASStackLayoutAlignItems.stretch
        verticalStackLayoutSpec.spacing = 5.0
        verticalStackLayoutSpec.children = [overlayLayout, _filmOpeningCrawlLabel]
        
        let insetLayoutSpec = ASInsetLayoutSpec(insets: UIEdgeInsetsMake(10, 16, 10, 10), child: verticalStackLayoutSpec)
        
        return insetLayoutSpec
    }
    
    // MARK: Helper
    
    fileprivate func createLayerBackedTextNode(attributedString: NSAttributedString) -> ASTextNode {
        let textNode = ASTextNode()
        textNode.isLayerBacked = true
        textNode.attributedText = attributedString
        
        return textNode
    }

}
