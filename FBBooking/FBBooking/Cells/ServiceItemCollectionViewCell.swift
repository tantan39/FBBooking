//
//  ServiceItemCollectionViewCell.swift
//  FBBooking
//
//  Created by Tan Tan on 3/30/21.
//

import UIKit

class ServiceItemCollectionViewCell: BaseCollectionViewCell {
    private let mainView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.cornerRadius = 5.0
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Classic manicure"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let lable = UILabel()
        lable.numberOfLines = 0
    
        lable.text = "A relaxing manicure starts with trimming, shaping, and cuticle reduction"
        lable.font = UIFont.systemFont(ofSize: 14)
        lable.textColor = .lightGray
        return lable
    }()
    
    private let iconClockImageView: UIImageView = {
        let imgv = UIImageView()
        imgv.image = UIImage(named: "Clock")
        imgv.contentMode = .scaleAspectFit
        return imgv
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.text = "25 minutes"
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.text = "$15"
        return label
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
        setupTitleLabel()
        setupDescriptionLabel()
        setupIconImageView()
        setupTimeLabel()
        setupArrowImageView()
        setupPriceLabel()
        
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
    
    private func setupTitleLabel() {
        self.mainView.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { (maker) in
            maker.leading.equalToSuperview().offset(Dimension.shared.normalVerticalMargin)
            maker.top.equalToSuperview().offset(Dimension.shared.normalVerticalMargin)
        }
    }
    
    private func setupDescriptionLabel() {
        self.mainView.addSubview(self.descriptionLabel)
        self.descriptionLabel.snp.makeConstraints { (maker) in
            maker.leading.equalTo(self.titleLabel)
            maker.top.equalTo(self.titleLabel.snp.bottom).offset(6)
            maker.width.equalToSuperview().multipliedBy(0.75)
        }
    }
    
    private func setupIconImageView() {
        self.mainView.addSubview(self.iconClockImageView)
        self.iconClockImageView.snp.makeConstraints { (maker) in
            maker.leading.equalTo(self.descriptionLabel.snp.leading)
            maker.top.equalTo(self.descriptionLabel.snp.bottom).offset(6)
            maker.width.height.equalTo(20)

        }
    }

    
    private func setupTimeLabel() {
        self.mainView.addSubview(self.timeLabel)
        self.timeLabel.snp.makeConstraints { (maker) in
            maker.leading.equalTo(self.iconClockImageView.snp.trailing).offset(Dimension.shared.smallVerticalMargin)
            maker.centerY.equalTo(self.iconClockImageView)
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
    
    private func setupPriceLabel() {
        self.mainView.addSubview(self.priceLabel)
        self.priceLabel.snp.makeConstraints { (maker) in
            maker.centerY.equalTo(self.arrowImageView)
            maker.trailing.equalTo(self.arrowImageView.snp.leading).offset(-Dimension.shared.smallVerticalMargin)
        }
    }

}
