//
//  HeaderPager.swift
//  Tatx
//
//  Created by MOHAMED ABD ELHAMED AHMED on 06/01/2022.
//

import UIKit

class HeaderPagerView: UIView {
    
    @IBOutlet weak var contentView : UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configurationView()
     }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configurationView()
    }
    
    private func configurationView(){
        Bundle.main.loadNibNamed("\(HomeHeaderView.self)", owner: self, options: nil)
        guard let view = contentView else {return}
        view.frame = self.bounds
        addSubview(view)
    }
    
    
    
}




extension HeaderPagerView {
    func notifyDatasourceChanged() {
        collectionView.reloadData()
    }
}
