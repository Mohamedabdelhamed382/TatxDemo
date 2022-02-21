//
//  HomeHeaderView.swift
//  Tatx
//
//  Created by MOHAMED ABD ELHAMED AHMED on 06/01/2022.
//

import UIKit

class HomeHeaderView: UIView {
    
    //MARK:- attributes
    
    var arrImage = [UIImage(systemName: "personalhotspot")!,UIImage(systemName: "personalhotspot")!,UIImage(systemName: "personalhotspot")!,UIImage(systemName: "personalhotspot")!,UIImage(systemName: "personalhotspot")!,UIImage(systemName: "personalhotspot")!]
    var timer:Timer?
    var currentCellIndex: Int = 0
    
    //MARK:- Outlets
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var contentView : UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configurationView()
    }
    
    //MARK:- Cell LifeCycle
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configurationView()
    }
    
    //MARK:- configure Cell
    
    private func configurationView(){
       Bundle.main.loadNibNamed("\(HomeHeaderView.self)", owner: self, options: nil)
        guard let view = contentView else {return}
        view.frame = self.bounds
        addSubview(view)
        setupUI()
    }
}

//MARK:- CollectionView Setup Cell

extension HomeHeaderView {
    private func setupUI() {
        registerCollectionViewCell()
        setupCollectionViewLayout()
        startTimer()
        pageControlImplantation()
    }
    
    private func registerCollectionViewCell() {
        let homeHeaderViewCellNib = UINib(nibName: "\(HomeHeaderCollectionViewCell.self)", bundle: nil)
        collectionView.register(homeHeaderViewCellNib, forCellWithReuseIdentifier: "\(HomeHeaderCollectionViewCell.self)")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func setupCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView.setCollectionViewLayout(layout, animated: false)
    }
}

//MARK:- CollectionView Basic Method ViewDataSource ViewDelegate

extension HomeHeaderView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(HomeHeaderCollectionViewCell.self)", for: indexPath) as! HomeHeaderCollectionViewCell
        cell.setup(image: arrImage[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
//MARK:- Helper Method

extension HomeHeaderView {
    
    //MARK:- reload data
    func notifyDatasourceChanged() {
        collectionView.reloadData()
    }
    
    //MARK:- timer init
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(moveToNextIndex), userInfo: nil, repeats: true)
    }
    
    //MARK:- timer implantation method
    @objc
    func moveToNextIndex(){
        if currentCellIndex < arrImage.count-1
        {
            currentCellIndex += 1
        }
        else{
            currentCellIndex = 0
        }
        collectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .centeredHorizontally, animated: true)
        pageControl.currentPage = currentCellIndex
    }
    
    //MARK:- pagecontrol implantation method
    
    func pageControlImplantation(){
        pageControl.numberOfPages = arrImage.count
    }
}
