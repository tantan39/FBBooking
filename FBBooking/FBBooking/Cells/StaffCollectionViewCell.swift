//
//  StaffCollectionViewCell.swift
//  FBBooking
//
//  Created by Tan Tan on 3/30/21.
//

import UIKit

class StaffCollectionViewCell: BaseCollectionViewCell {
    private let photoImageView: UIImageView = {
        let imgv = UIImageView()
        imgv.image = UIImage(named: "Staff")
        imgv.contentMode = .scaleAspectFit
        return imgv
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.text = "Amelia"
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    override func setupUIComponents() {
        setupPhotoImageView()
        setupNameLabel()
    }
    
    private func setupPhotoImageView() {
        self.addSubview(photoImageView)
        self.photoImageView.snp.makeConstraints { (maker) in
            maker.top.equalToSuperview()
            maker.centerX.equalToSuperview()
            maker.width.height.equalTo(56)
        }
    }
    
    private func setupNameLabel() {
        self.addSubview(nameLabel)
        self.nameLabel.snp.makeConstraints { (maker) in
            maker.top.equalTo(self.photoImageView.snp.bottom).offset(Dimension.shared.smallVerticalMargin)
            maker.centerX.equalToSuperview()
        }
    }
}
