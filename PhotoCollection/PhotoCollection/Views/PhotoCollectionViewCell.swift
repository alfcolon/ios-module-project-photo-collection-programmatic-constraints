//
//  PhotoCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    //MARK: -Properties
    
    var photo: Photo?{
        didSet{
            setUpSubviews()
        }
    }
    
    //MARK: - Methods
    
    func setUpSubviews(){
        guard let photo = photo else { return }
//        self.translatesAutoresizingMaskIntoConstraints = false
        
        let imageView = UIImageView()
        let imageData = photo.imageData
        let image = UIImage(data: imageData)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = image
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: imageView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 5)
        ])
        self.addSubview(imageView)
        
        let title = photo.title
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = title
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: label, attribute: .top, relatedBy: .equal, toItem: imageView, attribute: .bottom, multiplier: 1, constant: 5),
            NSLayoutConstraint(item: label, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 5),
            NSLayoutConstraint(item: label, attribute: .centerX, relatedBy: .equal, toItem: imageView, attribute: .centerX, multiplier: 1, constant: 0)
        ])
        self.addSubview(label)
    }
}
