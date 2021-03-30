//
//  CategoryItemCollectionViewCell.swift
//  FBBooking
//
//  Created by Tan Tan on 3/30/21.
//

import UIKit

class CategoryItemCollectionViewCell: BaseCollectionViewCell {
    private let containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.lightGray.cgColor
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "Manicures"
        label.textAlignment = .center
        return label
    }()
    
    override var isSelected: Bool {
        didSet {
            self.titleLabel.textColor = isSelected ? .purple : .black
            self.containerView.layer.borderColor  = isSelected ? UIColor.purple.cgColor : UIColor.lightGray.cgColor
        }
    }
    
    override func setupUIComponents() {
        setupContainerView()
        setupTitleLabel()
    }
    
    private func setupContainerView() {
        self.addSubview(self.containerView)
        self.containerView.snp.makeConstraints { (maker) in
            maker.top.equalToSuperview().offset(Dimension.shared.smallVerticalMargin)
            maker.left.equalToSuperview().offset(Dimension.shared.smallVerticalMargin)
            maker.right.equalToSuperview().offset(-Dimension.shared.smallVerticalMargin)
            maker.bottom.equalToSuperview().offset(-Dimension.shared.smallVerticalMargin)
        }
    }
    
    private func setupTitleLabel() {
        self.containerView.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { (maker) in
            maker.edges.equalToSuperview()
        }
    }
    
    func setValue(title: String) {
        self.titleLabel.text = title
    }
}
