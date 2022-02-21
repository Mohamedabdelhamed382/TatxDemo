//
//  ProductTableViewCell.swift
//  TatxDemo
//
//  Created by MOHAMED ABD ELHAMED AHMED on 19/02/2022.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    @IBOutlet weak var contantView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        new()
    }
    
    func new(){
        let view = ProductMainView()
        contantView.addSubview(view)
        view.frame = self.contantView.bounds
    }

    
    
}
