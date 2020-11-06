//
//  ViewController.swift
//  DynamicWidthCollectionViewCelltest
//
//  Created by saw pyaehtun on 05/11/2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionViewDynamicWidth: DynmicHeightCollectionView!
    
    let stringList : [String] = ["one", "two two","three three three", "four four four four"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        collectionViewDynamicWidth.reloadData()
    }
    
    func setupCollectionView(){
        let layout = TokenCollViewFlowLayout.init()
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .vertical
        
        collectionViewDynamicWidth.isDynamicSizeRequired = true
        collectionViewDynamicWidth.collectionViewLayout = layout
        collectionViewDynamicWidth.translatesAutoresizingMaskIntoConstraints = false
        collectionViewDynamicWidth.delegate = self
        collectionViewDynamicWidth.dataSource = self
        collectionViewDynamicWidth.register(UINib(nibName: String(describing: TitleCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: TitleCollectionViewCell.self))
        
    }


}

extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stringList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: TitleCollectionViewCell.self), for: indexPath) as! TitleCollectionViewCell
        item.setupItem(title: stringList[indexPath.row])
        return item
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      
        let text = stringList[indexPath.item]
      
      let cellWidth = text.size(withAttributes:[.font: UIFont.systemFont(ofSize:14.0)]).width + 20.0
        return CGSize(width: cellWidth, height: 30.0)
//      if collectionView == topCollView {
//
//      } else {
//        return CGSize(width: cellWidth, height: 30.0)
//      }
    }
    
}

