//
//  BookingItemCollectionViewCell.swift
//  FBBooking
//
//  Created by Tan Tan on 3/31/21.
//

import UIKit

class BookingItemCollectionViewCell: BaseCollectionViewCell {
    
    private let serviceNameLabel: UILabel = {
        let name = UILabel()
        name.text = "Classic manicure"
        name.font = UIFont.systemFont(ofSize: 16)
        name.textColor = UIColor.darkGray
        return name
    }()
    
    private let priceLabel: UILabel = {
        let name = UILabel()
        name.text = "$15"
        name.font = UIFont.boldSystemFont(ofSize: 16)
        name.textColor = UIColor.black
        return name
    }()
    
    private let staffNameLabel: UILabel = {
        let name = UILabel()
        
        let attrString = NSMutableAttributedString(string: "By", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14),
                                                                              NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        let nameStr = NSAttributedString(string: " Nguyen", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14),
                                                                        NSAttributedString.Key.foregroundColor: UIColor.black])
        attrString.append(nameStr)
        name.attributedText = attrString
        return name
    }()
    
    private let timeLabel: UILabel = {
        let name = UILabel()
        name.text = "10:30-11:30"
        name.font = UIFont.systemFont(ofSize: 16)
        name.textColor = UIColor.lightGray
        return name
    }()
    
    override func setupUIComponents() {
        setupServiceNameLabel()
        setupStaffNameLabel()
        setupPriceLabel()
        setupTimeLabel()
    }
    
    private func setupServiceNameLabel() {
        self.addSubview(self.serviceNameLabel)
        self.serviceNameLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(Dimension.shared.largeHorizontalMargin)
        }
    }
    
    private func setupStaffNameLabel() {
        self.addSubview(self.staffNameLabel)
        self.staffNameLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(self.serviceNameLabel)
            make.top.equalTo(self.serviceNameLabel.snp.bottom).offset(Dimension.shared.smallVerticalMargin)
        }
    }
    
    private func setupPriceLabel() {
        self.addSubview(self.priceLabel)
        self.priceLabel.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().offset(-Dimension.shared.largeHorizontalMargin)
            make.top.equalToSuperview()
        }
    }
    
    private func setupTimeLabel() {
        self.addSubview(self.timeLabel)
        self.timeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.staffNameLabel)
            make.trailing.equalTo(self.priceLabel)
        }
    }
}
