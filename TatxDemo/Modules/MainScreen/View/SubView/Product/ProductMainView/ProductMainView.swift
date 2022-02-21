//
//  ProductMainViewViewController.swift
//  TatxDemo
//
//  Created by MOHAMED ABD ELHAMED AHMED on 19/02/2022.
//

import UIKit

class ProductMainView: UIView {

  
    @IBOutlet weak var collectionview: UICollectionView!
    
    //MARK:- Cell LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configurationView()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configurationView()
        setupUI()
    }
    
    private func configurationView() {
        let bundle = Bundle.init(for: ProductMainView.self)
        if let view = bundle.loadNibNamed("ProductMainView", owner: self, options: nil), let contentView = view.first as? UIView {
            addSubview(contentView)
            contentView.frame = self.bounds
            contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        }
        
        
    }

}
//MARK:- CollectionView Setup Cell

extension ProductMainView {
    private func setupUI() {
        registerCollectionViewCell()
        setupCollectionViewLayout()
       
    }
    
    private func registerCollectionViewCell() {
        let ProductCollectionViewCellNib = UINib(nibName: "\(ProductCollectionViewCell.self)", bundle: nil)
        collectionview.register(ProductCollectionViewCellNib, forCellWithReuseIdentifier: "\(ProductCollectionViewCell.self)")
        collectionview.dataSource = self
        collectionview.delegate = self
    }
    
    private func setupCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionview.setCollectionViewLayout(layout, animated: false)
    }
}

//MARK:- CollectionView Basic Method ViewDataSource ViewDelegate

extension ProductMainView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ProductCollectionViewCell.self)", for: indexPath) as! ProductCollectionViewCell
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
