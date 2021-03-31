//
//  TotalCustomView.swift
//  FBBooking
//
//  Created by Tan Tan on 3/31/21.
//

import UIKit

class TotalCustomView: UIView {
    private let totalLabel: UILabel = {
        let label = UILabel()
        label.text = TextManager.total
        label.font = UIFont.boldSystemFont(ofSize: 18)
        
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "$30"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        
        return label
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
        setupTotalLabel()
        setupPriceLabel()
    }
    
    private func setupTotalLabel() {
        self.addSubview(self.totalLabel)
        self.totalLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    private func setupPriceLabel() {
        self.addSubview(self.priceLabel)
        self.priceLabel.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview()
            make.top.equalTo(self.totalLabel)
        }
    }
}
