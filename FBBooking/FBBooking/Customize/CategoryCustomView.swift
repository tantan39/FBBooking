//
//  CategoryCustomView.swift
//  FBBooking
//
//  Created by Tan Tan on 3/30/21.
//

import UIKit

class CategoryCustomView: UIView {
    
    let dataSource = ["Manicures","Pedicures", "Waxing", "Skincare"]
    
    
    lazy var categoryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal

        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(CategoryItemCollectionViewCell.self, forCellWithReuseIdentifier: "CategoryItemCollectionViewCell")
        collection.backgroundColor = UIColor.white
        collection.scrollIndicatorInsets = UIEdgeInsets(top: 1000, left: 1000, bottom: 1000, right: 1000)
        collection.dataSource = self
        collection.delegate = self
        return collection
    }()
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        self.setupUIComponents()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUIComponents()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupUIComponents()
    }
    
    open func setupUIComponents() {
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        self.addSubview(self.categoryCollectionView)
        self.categoryCollectionView.snp.makeConstraints { (maker) in
            maker.top.leading.trailing.bottom.equalToSuperview()
//            maker.height.equalToSuperview()
        }
    }
}

extension CategoryCustomView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryItemCollectionViewCell", for: indexPath) as? CategoryItemCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setValue(title: dataSource[indexPath.row])
        return cell
    }
}

extension CategoryCustomView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = CGSize(width: 1000, height: collectionView.bounds.height)
        let option = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        
        let estimateFrame = NSString(string: (dataSource[indexPath.row])).boundingRect(with: size, options: option, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)], context: nil)
        
        return CGSize(width: estimateFrame.width + (Dimension.shared.normalHorizontalMargin * 2) , height: collectionView.bounds.height)
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Dimension.shared.smallVerticalMargin
    }
}
