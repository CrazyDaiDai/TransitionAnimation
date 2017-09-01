//
//  ViewController.swift
//  TransitionAnimation
//
//  Created by 呆仔～林枫 on 2017/8/31.
//  Copyright © 2017年 Lin_Crazy. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIViewControllerTransitioningDelegate,UICollectionViewDelegate,UICollectionViewDataSource {

    let presentAnimator = PresentAnimator()
    
    let screen_w = UIScreen.main.bounds.size.width
    let screen_h = UIScreen.main.bounds.size.width
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = UIColor.init(patternImage: UIImage.init(named: "1")!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let lcvc = LCViewController()
        lcvc.view.backgroundColor = UIColor.init(patternImage: UIImage.init(named: "1")!)
        lcvc.transitioningDelegate = self
        let cell = collectionView.cellForItem(at: indexPath)
        presentAnimator.originFrame = cell?.frame
        lcvc.dismissAnimator.originFrame = cell?.frame
        present(lcvc, animated: true, completion: nil)
    }
    
    lazy var collectionView : UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: (self.screen_w - 200) * 0.5, height: 150)
        layout.minimumInteritemSpacing = 10.0
        layout.minimumLineSpacing = 10.0
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10)
        let collectionView : UICollectionView = UICollectionView.init(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.register(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return collectionView
    }()

    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return presentAnimator
    }

}

