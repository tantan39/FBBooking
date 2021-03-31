//
//  UIViewExtension.swift
//  FBBooking
//
//  Created by Tan Tan on 3/30/21.
//

import UIKit

// MARK: - Shadow
public extension UIView {
    public func addShadow(offSet: CGSize = CGSize(width: 1, height: 1), radius: CGFloat = 1, opactity: Float = 0.5, shadowColor: UIColor = UIColor.black) {
        self.layer.shadowOffset = offSet
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = opactity
        self.layer.shadowColor = shadowColor.cgColor
    }
}

public extension UIView {
    func addshadow(top: Bool,
                          left: Bool,
                          bottom: Bool,
                          right: Bool,
                          shadowRadius: CGFloat = 2.0,
                          shadowColor: UIColor,
                          shadowOffset: CGSize) {
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOffset = shadowOffset // CGSize(width: 0.0, height: -1)
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOpacity = 0.5
        
        let path = UIBezierPath()
        var x: CGFloat = 0
        var y: CGFloat = 0
        var viewWidth = self.frame.width
        var viewHeight = self.frame.height
        
        // here x, y, viewWidth, and viewHeight can be changed in
        // order to play around with the shadow paths.
        if (!top) {
            y+=(shadowRadius+1)
        }
        if (!bottom) {
            viewHeight-=(shadowRadius+1)
        }
        if (!left) {
            x+=(shadowRadius+1)
        }
        if (!right) {
            viewWidth-=(shadowRadius+1)
        }
        // selecting top most point
        path.move(to: CGPoint(x: x, y: y-5))
        // Move to the Bottom Left Corner, this will cover left edges
        /*
         |☐
         */
        path.addLine(to: CGPoint(x: x, y: viewHeight + 5))
        // Move to the Bottom Right Corner, this will cover bottom edge
        /*
         ☐
         -
         */
        path.addLine(to: CGPoint(x: viewWidth, y: viewHeight + 5))
        // Move to the Top Right Corner, this will cover right edge
        /*
         ☐|
         */
        path.addLine(to: CGPoint(x: viewWidth, y: y-5))
        // Move back to the initial point, this will cover the top edge
        /*
         _
         ☐
         */
        path.close()
        self.layer.shadowPath = path.cgPath
    }
    
    func addshadowToLeftAndRightSide(
        shadowRadius: CGFloat = 2.0,
        shadowColor: UIColor,
        shadowOffset: CGSize,
        addedOffset: CGFloat = 0.0,
        shadowOpacity: Float = 0.5) {
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOffset = shadowOffset // CGSize(width: 0.0, height: -1)
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOpacity = shadowOpacity
        
        let path = UIBezierPath()
        let x: CGFloat = 0
        var y: CGFloat = 0
        let viewWidth = self.frame.width
        var viewHeight = self.frame.height
        
        // here x, y, viewWidth, and viewHeight can be changed in
        // order to play around with the shadow paths.
        y+=(shadowRadius+1)
        viewHeight-=(shadowRadius+1)
        
        // selecting top most point
        path.move(to: CGPoint(x: x, y: y-addedOffset))
        // Move to the Bottom Left Corner, this will cover left edges
        /*
         |☐
         */
        path.addLine(to: CGPoint(x: x, y: viewHeight + addedOffset))
        // Move to the Bottom Right Corner, this will cover bottom edge
        /*
         ☐
         -
         */
        path.addLine(to: CGPoint(x: viewWidth, y: viewHeight + addedOffset))
        // Move to the Top Right Corner, this will cover right edge
        /*
         ☐|
         */
        path.addLine(to: CGPoint(x: viewWidth, y: y-addedOffset))
        // Move back to the initial point, this will cover the top edge
        /*
         _
         ☐
         */
        path.close()
        self.layer.shadowPath = path.cgPath
    }
}
