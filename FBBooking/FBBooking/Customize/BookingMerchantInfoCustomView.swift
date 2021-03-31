//
//  BookingMerchantInfoCustomView.swift
//  FBBooking
//
//  Created by Tan Tan on 3/31/21.
//

import UIKit

class BookingMerchantInfoCustomView: UIView {
    private let logoImageView: UIImageView = {
        let imgv = UIImageView(image: UIImage(named: "Logo-1"))
        imgv.layer.cornerRadius = 5.0
        imgv.clipsToBounds = true
        return imgv
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Cinderella Nails & Spa"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        
        let attrs = NSMutableAttributedString(string: "Cinderella Nails & Spa", attributes: [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16),
            NSAttributedString.Key.foregroundColor: UIColor.black
        ])
        
        let address = NSAttributedString(string: "\n\n1039 Main St, Windsor", attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14),
            NSAttributedString.Key.foregroundColor: UIColor.lightGray
        ])
        
        let phone = NSAttributedString(string: "\n\n(516)-766-7373", attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14),
            NSAttributedString.Key.foregroundColor: UIColor.lightGray
        ])
        
        attrs.append(address)
        attrs.append(phone)
        label.attributedText = attrs
        label.numberOfLines = 0
        return label
    }()
    
    private let dotlineImageView: UIImageView = {
        let imgv = UIImageView(image: UIImage(named: "Dotline"))
        imgv.contentMode = .scaleAspectFit
        return imgv
    }()
    
    private let addressLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "1039 Main St, Windsor"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()
    
    private let chatButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setImage(UIImage(named: "Chat"), for: .normal)
        button.contentMode = .scaleAspectFit
        return button
    }()
    
    private let locationButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setImage(UIImage(named: "Location"), for: .normal)
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
        setupLogoImageView()
        setupNameLabel()
        setupChatButton()
        setupLocationButton()
        setupDotline()
    }
    
    private func setupLogoImageView() {
        self.addSubview(self.logoImageView)
        logoImageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(Dimension.shared.largeVerticalMargin)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(40.0)
        }
    }
    
    private func setupNameLabel() {
        self.addSubview(self.nameLabel)
        self.nameLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(Dimension.shared.largeHorizontalMargin)
            make.top.equalTo(self.logoImageView.snp.bottom).offset(Dimension.shared.normalVerticalMargin)
//            make.bottom.equalToSuperview().offset(-Dimension.shared.normalVerticalMargin)
            
        }
    }
    
    private func setupChatButton() {
        self.addSubview(self.chatButton)
        self.chatButton.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().offset(-Dimension.shared.largeHorizontalMargin)
            make.bottom.equalTo(self.nameLabel.snp.centerY).multipliedBy(0.9)
            make.width.height.equalTo(20)
        }
    }
    
    private func setupLocationButton() {
        self.addSubview(self.locationButton)
        self.locationButton.snp.makeConstraints { (make) in
            make.trailing.equalTo(self.chatButton)
            make.top.equalTo(self.nameLabel.snp.centerY).multipliedBy(1.1)
            make.width.height.equalTo(20)
        }
    }
    
    private func setupDotline() {
        self.addSubview(self.dotlineImageView)
        self.dotlineImageView.snp.makeConstraints { (make) in
            make.top.equalTo(self.nameLabel.snp.bottom).offset(Dimension.shared.normalVerticalMargin)
            make.leading.equalToSuperview().offset(Dimension.shared.largeHorizontalMargin)
            make.trailing.equalToSuperview().offset(-Dimension.shared.largeHorizontalMargin)
            make.height.equalTo(1.5)
            make.bottom.equalToSuperview().offset(-Dimension.shared.normalVerticalMargin)
        }
    }
}
