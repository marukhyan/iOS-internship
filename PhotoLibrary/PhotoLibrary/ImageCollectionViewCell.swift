//
//  ImageCollectionViewCell.swift
//  PhotoLibrary
//
//  Created by David Marukhyan on 23.11.21.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imageView.image = nil
    }
}
