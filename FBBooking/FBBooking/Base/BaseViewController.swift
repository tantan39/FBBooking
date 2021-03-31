//
//  BaseViewController.swift
//  FBBooking
//
//  Created by Tan Tan on 3/30/21.
//

import UIKit

class BaseViewController: UIViewController {
    public var indicator: ActivityIndicator = ActivityIndicator()
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        if self.navigationController != nil {
            self.navigationItem.leftBarButtonItem = self.backBarButton()
        }

        self.initializeObjects()
        self.setupUIComponents()
    }
    
    open func initializeObjects() {
        // Where variables, objects will be initialized
    }
    
    open func setupUIComponents() {
        // Where UI components will be polished
    }
    
    open func backBarButton(overlayColor: UIColor? = nil) -> UIBarButtonItem {
        
        let button = UIButton.init(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -Dimension.shared.mediumVerticalMargin, bottom: 0, right: Dimension.shared.mediumVerticalMargin)
        button.addTarget(self, action: #selector(self.backOrDismiss), for: .touchUpInside)
        var image = UIImage(named: "Back")?.withRenderingMode(.alwaysOriginal)
        if let overlayColor = overlayColor {
            image = image?.withTintColor(overlayColor)
        }
        button.setImage(image, for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        let barButtonItem = UIBarButtonItem(customView: button)
        barButtonItem.customView?.snp.makeConstraints({ (maker) in
            maker.width.equalTo(44)
            maker.height.equalTo(44)
        })
        
        return barButtonItem
    }
    
    @objc open func backOrDismiss() {
        if let count = self.navigationController?.viewControllers.count, count > 1 {
            _ = self.navigationController?.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: {
                logDebug("Dismiss viewcontroller: \(self.classForCoder)")
            })
        }
    }
}

