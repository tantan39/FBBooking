//
//  MerchantsViewController.swift
//  FBBooking
//
//  Created by Tan Tan on 3/30/21.
//

import UIKit
import SnapKit
import Pulley
class MerchantsViewController: BaseViewController {
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search"
        searchBar.barStyle = .default
        searchBar.searchBarStyle = .minimal
        searchBar.backgroundColor = .white
        return searchBar
    }()

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(MerchantItemCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collection.backgroundColor = UIColor.white
        collection.dataSource = self
        collection.delegate = self
        return collection
    }()
    
    override func setupUIComponents() {
        super.setupUIComponents()
        
        self.navigationItem.title = TextManager.chooseMerchant
        
//        setupSearchBar()
        setupCollectionView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationItem.hidesBackButton = true
    }
    
    private func setupSearchBar() {
        self.view.addSubview(self.searchBar)
        self.searchBar.snp.makeConstraints { (maker) in
            if #available(iOS 11.0, *) {
                maker.top.equalTo(self.view.safeAreaInsets.top + 84)
            } else {
                maker.top.equalTo(self.topLayoutGuide.snp.bottom)
            }
            maker.leading.trailing.equalToSuperview()
            maker.height.equalTo(40)
        }
        
    }
    
    private func setupCollectionView() {
        self.view.addSubview(self.collectionView)
        self.collectionView.snp.makeConstraints { (maker) in
//            maker.top.equalTo(self.searchBar.snp.bottom)
            maker.top.equalTo(self.view.safeAreaLayoutGuide.snp.topMargin)
            maker.leading.trailing.bottom.equalToSuperview()
        }
        
    }
    
}

extension MerchantsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? MerchantItemCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
}

extension MerchantsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let rootVC = UIApplication.shared.windows.first?.rootViewController {
            let servicesRoute = ServicesRoute()
            servicesRoute.navigate(from: rootVC, transitionType: .push, animated: true)
        }
    }
}

extension MerchantsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Dimension.shared.smallVerticalMargin
    }
}

extension MerchantsViewController: PulleyDrawerViewControllerDelegate {
    func supportedDrawerPositions() -> [PulleyPosition] {
        return [.open]
    }
    
    
    
}
