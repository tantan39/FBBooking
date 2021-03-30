//
//  MerchantItemCollectionViewCell.swift
//  FBBooking
//
//  Created by Tan Tan on 3/30/21.
//

import UIKit

class MerchantItemCollectionViewCell: BaseCollectionViewCell {
    
    private let mainView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.cornerRadius = 5.0
        return view
    }()
    
    private let iconImageView: UIImageView = {
        let imgv = UIImageView()
        imgv.image = UIImage(named: "Logo")
        imgv.contentMode = .scaleAspectFit
        imgv.layer.cornerRadius = 5.0
        imgv.clipsToBounds = true
        return imgv
    }()
    
    private let descriptionLabel: UILabel = {
        let lable = UILabel()
        lable.numberOfLines = 0
        
        let attrString = NSMutableAttributedString()
        let title = NSAttributedString(string: "Cinderella Nails & Spa", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black,
                                                                                      NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)
        ])
        
        let address = NSAttributedString(string: "\n1039 Main St, Windsor", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray,
                                                                                      NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)
        ])
        
        let distance = NSAttributedString(string: "\nNail Salon 1.5", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray,
                                                                                      NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)
        ])
        
        attrString.append(title)
        attrString.append(address)
        attrString.append(distance)
        lable.attributedText = attrString
        return lable
    }()
    
    private let arrowImageView: UIImageView = {
        let imgv = UIImageView()
        imgv.image = UIImage(named: "Arrow")
        imgv.contentMode = .scaleAspectFit
        return imgv
    }()
    
    override func setupUIComponents() {
        super.setupUIComponents()
        
        setupMainView()
        setupIconImageView()
        setupDescriptionLabel()
        setupArrowImageView()
        
    }
    
    private func setupMainView() {
        self.addSubview(self.mainView)
        self.mainView.snp.makeConstraints { (maker) in
            maker.top.equalToSuperview().offset(Dimension.shared.smallVerticalMargin)
            maker.leading.equalToSuperview().offset(Dimension.shared.normalVerticalMargin)
            maker.trailing.equalToSuperview().offset(-Dimension.shared.normalVerticalMargin)
            maker.bottom.equalToSuperview().offset(-Dimension.shared.smallVerticalMargin)
        }
    }
    
    private func setupIconImageView() {
        self.mainView.addSubview(self.iconImageView)
        self.iconImageView.snp.makeConstraints { (maker) in
            maker.leading.equalToSuperview().offset(Dimension.shared.normalHorizontalMargin)
            maker.centerY.equalToSuperview()
            maker.width.height.equalTo(40)
        }
    }
    
    private func setupDescriptionLabel() {
        self.mainView.addSubview(self.descriptionLabel)
        self.descriptionLabel.snp.makeConstraints { (maker) in
            maker.top.equalToSuperview().offset(Dimension.shared.normalVerticalMargin)
            maker.leading.equalTo(self.iconImageView.snp.trailing).offset(Dimension.shared.normalVerticalMargin)
            maker.bottom.equalToSuperview().offset(-Dimension.shared.normalVerticalMargin)
        }
    }
    
    private func setupArrowImageView() {
        self.mainView.addSubview(self.arrowImageView)
        self.arrowImageView.snp.makeConstraints { (maker) in
            maker.trailing.equalToSuperview().offset(-Dimension.shared.normalHorizontalMargin)
            maker.centerY.equalToSuperview()
            maker.width.height.equalTo(10)
        }
    }
}
