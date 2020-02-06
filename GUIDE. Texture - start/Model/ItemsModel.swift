//
//  ItemsModel.swift
//  GUIDE. Texture - start
//
//  Created by Vladislav Mityuklyaev on 06/02/2020.
//  Copyright © 2020 Vladislav Mityuklyaev. All rights reserved.
//

import UIKit

struct Items {
    var title: String
    var description: String
    var image: UIImage?
    var imageURL: URL?
    
    init(title: String, description: String, image: UIImage? = nil, imageURL: URL? = nil) {
        self.title = title
        self.description = description
        self.image = image
        self.imageURL = imageURL
    }
}
