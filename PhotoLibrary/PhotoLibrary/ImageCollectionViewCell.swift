//
//  ImageCollectionViewCell.swift
//  PhotoLibrary
//
//  Created by David Marukhyan on 23.11.21.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    func setup(with urlString: String) {
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {return}
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: data)
            }
        }.resume()
    }
    
    override func prepareForReuse() {
        self.imageView.image = nil
    }
}
