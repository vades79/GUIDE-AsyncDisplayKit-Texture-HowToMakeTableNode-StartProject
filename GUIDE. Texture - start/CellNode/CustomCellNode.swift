//
//  CustomCellNode.swift
//  GUIDE. Texture - start
//
//  Created by Vladislav Mityuklyaev on 06/02/2020.
//  Copyright © 2020 Vladislav Mityuklyaev. All rights reserved.
//

import Foundation
import AsyncDisplayKit

class CustomCellNode: ASCellNode {
    
    var imageNode: ASNetworkImageNode  // Вместо UIImageView
    var titleNode: ASTextNode          // Вместо UILabel
    var descriptionNode: ASTextNode    // Вместо UILabel
    
    init(image: UIImage?, imageURL: URL?, title: String, description: String) {
        imageNode = ASNetworkImageNode()
        imageNode.cornerRoundingType = .defaultSlowCALayer
        imageNode.cornerRadius = 10
        if let imageURL = imageURL {
            imageNode.url = imageURL
        } else {
            imageNode.image = image ?? UIImage()
        }
        
        titleNode = ASTextNode()
        titleNode.attributedText = NSAttributedString(string: title, attributes: [.font: UIFont.boldSystemFont(ofSize: 16)])

        
        descriptionNode = ASTextNode()
        descriptionNode.attributedText = NSAttributedString(string: description)
        super.init()
        automaticallyManagesSubnodes = true
        
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let imageRatioSpec = ASRatioLayoutSpec(ratio: 0.5, child: imageNode)
        
        let nameInset = UIEdgeInsets(top: 8, left: 8, bottom: 0, right: 28)
        let nameInsetSpec = ASInsetLayoutSpec(insets: nameInset, child: titleNode)
        
        let descriprionInset = UIEdgeInsets(top: 4, left: 16, bottom: 16, right: 28)
        let descriptionInsetSpec = ASInsetLayoutSpec(insets: descriprionInset, child: descriptionNode)

        let verticalStackSpec = ASStackLayoutSpec(direction: .vertical, spacing: 0, justifyContent: .start, alignItems: .start, children: [imageRatioSpec, nameInsetSpec, descriptionInsetSpec])

         return verticalStackSpec
    }
}




