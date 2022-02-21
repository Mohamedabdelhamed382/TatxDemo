//
//  HomeHeaderCollectionViewCell.swift
//  Tatx
//
//  Created by MOHAMED ABD ELHAMED AHMED on 06/01/2022.
//

import UIKit

class HomeHeaderCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var autoSliderImage: UIImageView!
    func setup(image: UIImage){
        autoSliderImage.image = image
    }

}
