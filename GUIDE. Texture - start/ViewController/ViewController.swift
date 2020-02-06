//
//  ViewController.swift
//  GUIDE. Texture - start
//
//  Created by Vladislav Mityuklyaev on 06/02/2020.
//  Copyright © 2020 Vladislav Mityuklyaev. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class ViewController: ASViewController<ASDisplayNode> {
    
    var tableNode: ASTableNode {
        return node as! ASTableNode
    }
    
    var items = [Items(title: "Photo by David Clode on Unsplash",
                       description: "Wery beautiful pictures of a parrot from David Clode",
                       image: UIImage(named: "GreenParrot")!),
                 Items(title: "Photo by Alexandre Debiève on Unsplash",
                       description: "Four assorted birds in the middle of the air during daytime",
                       image: UIImage(named: "FourAssortedBirds")!),
                 Items(title: "Photo by David Clode on Unsplash",
                       description: "Three green budgerigars perching on tree branch",
                       image: UIImage(named: "ThreeGreenBudgerigars")!),
                 Items(title: "Photo by Jonah Pettrich on Unsplash",
                       description: "Two parakeets",
                       image: UIImage(named: "TwoParakeets")!),
                 Items(title: "Photo by Paolo Nicolello on Unsplash",
                       description: "Two green parrots perched on tree branch during daytime",
                       image: UIImage(named: "TwoGreenParrots")!),
                 Items(title: "Photo by Benny Kirubakaran on Unsplash",
                       description: "Photo of blue and yellow macaw bird",
                       imageURL: URL(string: "https://clck.ru/M9wSr")!),
                 Items(title: "Photo by rigel on Unsplash",
                       description: "Green parrot perched on tree branch",
                       imageURL: URL(string: "https://clck.ru/M9wT5")!),
                 Items(title: "Photo by Bradley Ziffer on Unsplash",
                       description: "Tilt shift lens photography of green and red parrot bird",
                       imageURL: URL(string: "https://clck.ru/M9wTN")!)]
    
    init() {
        super.init(node: ASTableNode())
        tableNode.delegate = self
        tableNode.dataSource = self
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
}

extension ViewController: ASTableDataSource, ASTableDelegate {

    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
        
        let item = items[indexPath.row]
        
        return {
            let node = CustomCellNode(image: item.image,
                                      imageURL: item.imageURL,
                                      title: item.title,
                                      description: item.description)
            return node
        }
    }
}

