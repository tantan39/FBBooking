//
//  ServicesViewController.swift
//  FBBooking
//
//  Created by Tan Tan on 3/30/21.
//

import UIKit
import Presentr
import Pulley

class ServicesViewController: BaseViewController {
    
    private let categoryView: CategoryCustomView = {
        let view = CategoryCustomView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    lazy var mainCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(ServiceItemCollectionViewCell.self, forCellWithReuseIdentifier: "ServiceItemCollectionViewCell")
        collection.backgroundColor = UIColor.white
        collection.dataSource = self
        collection.delegate = self
        return collection
    }()
    
    override func setupUIComponents() {
        self.navigationItem.title = TextManager.chooseService
        self.view.backgroundColor = .white
        
        setupCategoryView()
        setupMainCollectionView()
    }
    
    private func setupCategoryView() {
        self.view.addSubview(self.categoryView)
        self.categoryView.snp.makeConstraints { (maker) in
            maker.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
            maker.leading.equalToSuperview().offset(Dimension.shared.normalVerticalMargin)
            maker.trailing.equalToSuperview().offset(-Dimension.shared.normalVerticalMargin)
            maker.height.equalTo(40)
        }
    }
    
    private func setupMainCollectionView() {
        self.view.addSubview(self.mainCollectionView)
        self.mainCollectionView.snp.makeConstraints { (maker) in
            maker.top.equalTo(self.categoryView.snp.bottom).offset(Dimension.shared.smallVerticalMargin)
            maker.leading.trailing.bottom.equalToSuperview()
        }
    }
}

extension ServicesViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ServiceItemCollectionViewCell", for: indexPath) as? ServiceItemCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.pulleyViewController?.setDrawerPosition(position: .open, animated: true)
    }
}

extension ServicesViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 140)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Dimension.shared.smallVerticalMargin
    }
}
