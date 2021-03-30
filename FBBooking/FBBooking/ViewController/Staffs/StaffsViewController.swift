//
//  StaffsViewController.swift
//  FBBooking
//
//  Created by Tan Tan on 3/30/21.
//

import Foundation
import Pulley
class StaffsViewController: BaseViewController, PulleyDrawerViewControllerDelegate {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = TextManager.chooseStaff
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Which staff you prefer for Classic manicure service?"
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(StaffCollectionViewCell.self, forCellWithReuseIdentifier: "StaffCollectionViewCell")
        collection.backgroundColor = UIColor.white
        collection.dataSource = self
        collection.delegate = self
        return collection
    }()
    
    override func setupUIComponents() {
        self.view.backgroundColor = .white
        
        setupTitleLabel()
        setupDescriptionLabel()
        setupCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.pulleyViewController?.setDrawerPosition(position: .closed, animated: true)
        
        self.pulleyViewController?.drawerTopInset = UIScreen.main.bounds.height/2
    }
    
    private func setupTitleLabel() {
        self.view.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { (maker) in
            maker.centerX.equalToSuperview()
            maker.top.equalToSuperview().offset(Dimension.shared.normalVerticalMargin)
        }
    }
    
    private func setupDescriptionLabel() {
        self.view.addSubview(self.descriptionLabel)
        self.descriptionLabel.snp.makeConstraints { (maker) in
            maker.top.equalTo(self.titleLabel.snp.bottom).offset(Dimension.shared.largeVerticalMargin)
            maker.centerX.equalToSuperview()
            maker.leading.equalToSuperview().offset(Dimension.shared.normalHorizontalMargin)
            maker.trailing.equalToSuperview().offset(-Dimension.shared.normalHorizontalMargin)
        }
    }
    
    private func setupCollectionView() {
        self.view.addSubview(self.collectionView)
        self.collectionView.snp.makeConstraints { (maker) in
            maker.top.equalTo(self.descriptionLabel.snp.bottom).offset(Dimension.shared.largeVerticalMargin)
            maker.leading.equalToSuperview().offset(Dimension.shared.normalHorizontalMargin)
            maker.trailing.equalToSuperview().offset(-Dimension.shared.normalHorizontalMargin)
            maker.bottom.equalToSuperview()
        }
    }
    
    func supportedDrawerPositions() -> [PulleyPosition] {
        return [.open, .collapsed, .closed]
    }

    func collapsedDrawerHeight(bottomSafeArea: CGFloat) -> CGFloat {
        return 0
    }
    
    
}

extension StaffsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StaffCollectionViewCell", for: indexPath) as? StaffCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let router = ScheduleRoute()
        self.pulleyViewController?.setDrawerPosition(position: .collapsed, animated: true)
        router.navigate(from: self.pulleyViewController?.primaryContentViewController, transitionType: .push, animated: true)
    }
}

extension StaffsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding = 20.0
        let width = Double((collectionView.bounds.width - (CGFloat(padding) * 4.0)) / 4.0)
        return CGSize(width: width , height: width + padding)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}
