//
//  AddServicesCustomView.swift
//  FBBooking
//
//  Created by Tan Tan on 3/30/21.
//

import UIKit

class AddServicesCustomView: UIView {
    private let containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5.0
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.clipsToBounds = true
        return view
    }()
    
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
        name.font = UIFont.systemFont(ofSize: 16)
        name.textColor = UIColor.darkGray
        return name
    }()
    
    private let staffNameLabel: UILabel = {
        let name = UILabel()
        
        let attrString = NSMutableAttributedString(string: "By", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14),
                                                                              NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        let nameStr = NSAttributedString(string: " Nguyen", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14),
                                                                        NSAttributedString.Key.foregroundColor: UIColor.black])
        attrString.append(nameStr)
        name.attributedText = attrString
        return name
    }()
    
    private let deleteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Delete"), for: .normal)
        button.contentMode = .scaleAspectFit
        return button
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
        setupContainerView()
        setupServiceNameLabel()
        setupPriceLabel()
        setupStaffNameLabel()
        setupDeleteButton()
    }
    
    private func setupContainerView() {
        self.addSubview(self.containerView)
        self.containerView.snp.makeConstraints { (maker) in
            maker.top.equalToSuperview().offset(Dimension.shared.smallVerticalMargin)
            maker.leading.equalToSuperview().offset(Dimension.shared.smallVerticalMargin)
            maker.trailing.equalToSuperview().offset(-Dimension.shared.smallVerticalMargin)
            maker.bottom.equalToSuperview().offset(-Dimension.shared.smallVerticalMargin)
        }
    }
    
    private func setupServiceNameLabel() {
        self.containerView.addSubview(self.serviceNameLabel)
        self.serviceNameLabel.snp.makeConstraints { (maker) in
            maker.top.equalToSuperview().offset(Dimension.shared.mediumVerticalMargin)
            maker.leading.equalToSuperview().offset(Dimension.shared.mediumVerticalMargin)
        }
    }
    
    private func setupPriceLabel() {
        self.containerView.addSubview(self.priceLabel)
        self.priceLabel.snp.makeConstraints { (maker) in
            maker.top.equalTo(self.serviceNameLabel)
            maker.trailing.equalToSuperview().offset(-Dimension.shared.mediumVerticalMargin)
        }
    }
    
    private func setupStaffNameLabel() {
        self.containerView.addSubview(self.staffNameLabel)
        self.staffNameLabel.snp.makeConstraints { (maker) in
            maker.top.equalTo(self.serviceNameLabel.snp.bottom).offset(Dimension.shared.mediumVerticalMargin)
            maker.leading.equalTo(self.serviceNameLabel)
            maker.bottom.equalToSuperview().offset(-Dimension.shared.mediumVerticalMargin)
        }
    }
    
    private func setupDeleteButton() {
        self.containerView.addSubview(self.deleteButton)
        self.deleteButton.snp.makeConstraints { (maker) in
            maker.trailing.equalTo(-Dimension.shared.mediumVerticalMargin)
            maker.centerY.equalTo(self.staffNameLabel)
            maker.width.height.equalTo(16)
        }
    }
}
