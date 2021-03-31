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
    
    lazy var toggleImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Grabber"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = TextManager.chooseMerchant
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    
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
        self.view.backgroundColor = .white
        setupToggle()
        setupTitleLabel()
        setupSearchBar()
        setupCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let pulley = self.pulleyViewController {
            pulley.setDrawerPosition(position: .open, animated: true)
        }
    }
    
    public func setupToggle() {
        self.view.addSubview(self.toggleImageView)
        self.toggleImageView.snp.makeConstraints { (maker) in
            maker.top.equalToSuperview().offset(Dimension.shared.normalVerticalMargin)
            maker.centerX.equalToSuperview()
            maker.height.equalTo(3)
        }
    }

    private func setupTitleLabel() {
        self.view.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { (maker) in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(self.toggleImageView.snp.bottom).offset(Dimension.shared.mediumVerticalMargin)
        }
    }
    
    private func setupSearchBar() {
        self.view.addSubview(self.searchBar)
        self.searchBar.snp.makeConstraints { (maker) in
            maker.top.equalTo(self.titleLabel.snp.bottom).offset(Dimension.shared.mediumVerticalMargin)
            maker.leading.trailing.equalToSuperview()
            maker.height.equalTo(40)
        }
        
    }
    
    private func setupCollectionView() {
        self.view.addSubview(self.collectionView)
        self.collectionView.snp.makeConstraints { (maker) in
            maker.top.equalTo(self.searchBar.snp.bottom).offset(Dimension.shared.normalVerticalMargin)
//            maker.top.equalTo(self.view.safeAreaLayoutGuide.snp.topMargin)
            
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
        if let pulley = self.pulleyViewController {
            let servicesRoute = ServicesRoute()
            pulley.setDrawerPosition(position: .collapsed, animated: true)
            servicesRoute.navigate(from: self.pulleyViewController?.primaryContentViewController, transitionType: .present, animated: true)
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

//extension MerchantsViewController: PulleyDrawerViewControllerDelegate {
//    func supportedDrawerPositions() -> [PulleyPosition] {
//        return [.open]
//    }
//
//
//
//}
