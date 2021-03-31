//
//  ConfirmationViewController.swift
//  FBBooking
//
//  Created by Tan Tan on 3/30/21.
//

import UIKit
import Pulley
class ConfirmationViewController: BaseViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = TextManager.confirmation
        label.font = UIFont.boldSystemFont(ofSize: 18)
        
        return label
    }()
    
    private let closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Close"), for: .normal)
        return button
    }()
    
    private let containerView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        view.addShadow(
            offSet: CGSize(width: 0, height: 0),
            radius: 3.0,
            opactity: 0.2,
            shadowColor: .lightGray
        )
        return view
    }()
    
    private let serviceInfoView: BookingMerchantInfoCustomView = {
        let view = BookingMerchantInfoCustomView(frame: .zero)
        return view
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(BookingItemCollectionViewCell.self, forCellWithReuseIdentifier: "BookingItemCollectionViewCell")
        collection.backgroundColor = UIColor.white
        collection.dataSource = self
        collection.delegate = self
        collection.isScrollEnabled = false
        return collection
    }()
    
    private let dotlineImageView: UIImageView = {
        let imgv = UIImageView(image: UIImage(named: "Dotline"))
        imgv.contentMode = .scaleAspectFit
        return imgv
    }()
    
    private let totalCustomView: TotalCustomView = {
        let totalView = TotalCustomView(frame: .zero)
//        totalView.backgroundColor = .lightGray
        return totalView
    }()
    
    private let homeButton: FBRoundedCornerButton = {
        let button = FBRoundedCornerButton()
        button.backgroundColor = .primary1
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitle(TextManager.backToHome, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        return button
    }()
    
    override func setupUIComponents() {
        self.view.backgroundColor = .white
        
        setupTitleLabel()
        setupCloseButton()
        setupContainerView()
        setupServiceInfoView()
        setupCollectionView()
        setupDotline()
        setupTotalView()
        setupHomeButton()
        
        handleObservers()
    }
    
    private func handleObservers() {
        self.closeButton.rx.controlEvent(.touchUpInside).subscribe { (_) in
            self.dismiss(animated: true, completion: nil)
        }
        
        self.homeButton.rx.controlEvent(.touchUpInside).subscribe { (_) in
            let mainVC = UINavigationController(rootViewController: MainViewController())
            let merchantVC = MerchantsViewController()
            
            let pulleyVC = PulleyViewController(contentViewController: mainVC, drawerViewController: merchantVC)
            
            RoutingExecutor.navigate(from: self, to: pulleyVC, transitionType: .changeRootController)
        }
    }
    
    private func setupTitleLabel() {
        self.view.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { (maker) in
            maker.top.equalTo(self.view.safeAreaLayoutGuide.snp.topMargin).offset(Dimension.shared.mediumVerticalMargin_12)
            maker.centerX.equalToSuperview()
        }
    }
    
    private func setupCloseButton() {
        self.view.addSubview(self.closeButton)
        self.closeButton.snp.makeConstraints { (maker) in
            maker.centerY.equalTo(self.titleLabel)
            maker.leading.equalToSuperview().offset(Dimension.shared.normalHorizontalMargin)
        }
    }
    
    private func setupContainerView() {
        self.view.addSubview(self.containerView)
        self.containerView.snp.makeConstraints { (maker) in
            maker.top.equalTo(self.titleLabel.snp.bottom).offset(Dimension.shared.largeVerticalMargin_32)
            maker.leading.equalToSuperview().offset(Dimension.shared.largeVerticalMargin_32)
            maker.trailing.equalToSuperview().offset(-Dimension.shared.largeVerticalMargin_32)
//            maker.bottom.equalToSuperview().offset(-Dimension.shared.largeVerticalMargin_32)
        }
    }
    
    private func setupServiceInfoView() {
        self.containerView.addSubview(self.serviceInfoView)
        self.serviceInfoView.snp.makeConstraints { (maker) in
            maker.top.leading.trailing.equalToSuperview()
        }
    }
    
    private func setupCollectionView() {
        self.containerView.addSubview(self.collectionView)
        self.collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(self.serviceInfoView.snp.bottom).offset(Dimension.shared.normalVerticalMargin)
            make.leading.equalTo(self.serviceInfoView.snp.leading)
            make.trailing.equalTo(self.serviceInfoView.snp.trailing)
            make.height.equalTo(120)
            
        }
    }
    
    private func setupDotline() {
        self.containerView.addSubview(self.dotlineImageView)
        self.dotlineImageView.snp.makeConstraints { (make) in
            make.top.equalTo(self.collectionView.snp.bottom).offset(Dimension.shared.mediumHorizontalMargin)
            make.leading.equalToSuperview().offset(Dimension.shared.largeHorizontalMargin)
            make.trailing.equalToSuperview().offset(-Dimension.shared.largeHorizontalMargin)
            make.height.equalTo(1.5)
        }
    }
    
    private func setupTotalView() {
        self.containerView.addSubview(self.totalCustomView)
        self.totalCustomView.snp.makeConstraints { (make) in
            make.top.equalTo(self.dotlineImageView.snp.bottom).offset(Dimension.shared.normalVerticalMargin)
            make.leading.trailing.equalTo(self.dotlineImageView)
//            make.height.equalTo(30)
        }
    }
    
    private func setupHomeButton() {
        self.containerView.addSubview(self.homeButton)
        self.homeButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.totalCustomView.snp.bottom).offset(Dimension.shared.largeVerticalMargin)
            make.leading.trailing.equalTo(self.totalCustomView)
            make.height.equalTo(Dimension.shared.buttonHeight)
            make.bottom.equalToSuperview().offset(-Dimension.shared.largeVerticalMargin)
        }
    }
}

extension ConfirmationViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookingItemCollectionViewCell", for: indexPath) as? BookingItemCollectionViewCell else {
            return UICollectionViewCell()
        }

        return cell
    }
}


extension ConfirmationViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Dimension.shared.normalVerticalMargin
    }
}

