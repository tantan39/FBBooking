//
//  Dimension.swift
//  FBBooking
//
//  Created by Tan Tan on 3/30/21.
//

import UIKit

public let dimension = Dimension.shared

open class Dimension {
    public static let shared = Dimension()
    
    public var widthScreen: CGFloat = 1.0
    public var heightScreen: CGFloat = 1.0
    public var widthScale: CGFloat = 1.0
    public var heightScale: CGFloat = 1.0
    
    private init() {
        self.widthScale = UIScreen.main.bounds.width / 375
        self.heightScale = UIScreen.main.bounds.height / 667
        self.widthScreen = UIScreen.main.bounds.width
        self.heightScreen = UIScreen.main.bounds.height
        
        if self.widthScale >= 2.0 {
            self.widthScale /= 1.4
            self.heightScale /= 1.4
        }
    }
    
    public var fontScale: CGFloat {
        return 1.0
    }
    
    // MARK: Default height
    public var buttonHeight: CGFloat {
        return 48 //* self.heightScale
    }
    
    public var mediumButtonHeight: CGFloat {
        return 40 //* self.heightScale
    }
    
    public var smallButtonHeight: CGFloat {
        return 32 //* self.heightScale
    }
    
    public var textViewHeight: CGFloat {
        return 0.108 * self.heightScreen
    }
    
    public var largeTextViewHeight: CGFloat {
        return 0.231 * self.heightScreen
    }

    public var textFieldHeight: CGFloat {
        return 52 * self.heightScale
    }
    
    // MARK: Spacing
    public var smallHorizontalMargin: CGFloat {
        return 4 * self.widthScale
    }
    
    public var smallVerticalMargin: CGFloat {
        return 4 * self.widthScale
    }
    
    public var mediumHorizontalMargin: CGFloat {
        return 8 * self.widthScale
    }
    
    public var mediumVerticalMargin: CGFloat {
        return 8 * self.widthScale
    }
    
    public var mediumHorizontalMargin_12: CGFloat {
        return 12 * self.widthScale
    }
    
    public var mediumVerticalMargin_12: CGFloat {
        return 12 * self.widthScale
    }
    
    public var normalHorizontalMargin: CGFloat {
        return 16 * self.widthScale
    }
    
    public var normalVerticalMargin: CGFloat {
        return 16 * self.widthScale
    }
    
    public var largeHorizontalMargin: CGFloat {
        return 24 * self.widthScale
    }
    
    public var largeVerticalMargin: CGFloat {
        return 24 * self.widthScale
    }
    
    public var largeHorizontalMargin_32: CGFloat {
        return 32 * self.widthScale
    }
    
    public var largeVerticalMargin_32: CGFloat {
        return 32 * self.widthScale
    }
    
    public var largeVerticalMargin_38: CGFloat {
        return 38 * self.widthScale
    }
    
    public var largeHorizontalMargin_40: CGFloat {
        return 40 * self.widthScale
    }
    
    public var largeHorizontalMargin_42: CGFloat {
        return 40 * self.widthScale
    }
    
    public var largeVerticalMargin_40: CGFloat {
        return 40 * self.widthScale
    }
    
    public var largeHorizontalMargin_48: CGFloat {
        return 48 * self.widthScale
    }
    
    public var largeVerticalMargin_48: CGFloat {
        return 48 * self.widthScale
    }
    
    public var largeHorizontalMargin_56: CGFloat {
        return 56 * self.widthScale
    }
    
    public var largeVerticalMargin_56: CGFloat {
        return 56 * self.widthScale
    }
    
    public var largeHorizontalMargin_60: CGFloat {
        return 60 * self.widthScale
    }
    
    public var largeVerticalMargin_60: CGFloat {
        return 60 * self.widthScale
    }
}
