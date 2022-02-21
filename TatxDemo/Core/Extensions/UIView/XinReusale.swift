//
//  XinReusale.swift
//  TatxDemo
//
//  Created by MOHAMED ABD ELHAMED AHMED on 19/02/2022.
//

import Foundation
import UIKit

extension UIView {
    
    func loadViewFromNib(nibName: String) -> UIView? {
        let bundel = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundel)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }    
}
