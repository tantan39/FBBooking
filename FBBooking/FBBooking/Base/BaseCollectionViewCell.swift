//
//  BaseCollectionViewCell.swift
//  FBBooking
//
//  Created by Tan Tan on 3/30/21.
//

import UIKit

open class BaseCollectionViewCell: UICollectionViewCell, Reusable {
    
    // MARK: - Init
    open override func awakeFromNib() {
        super.awakeFromNib()
        self.setupUIComponents()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUIComponents()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupUIComponents()
    }
    
    // MARK: - Setup UI
    open func setupUIComponents() {
        // Where UI components will be polished
    }
}
