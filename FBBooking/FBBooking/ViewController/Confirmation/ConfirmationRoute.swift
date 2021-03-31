//
//  ConfirmationRoute.swift
//  FBBooking
//
//  Created by Tan Tan on 3/30/21.
//

import UIKit

class ConfirmationRoute: Router {
    func navigate(from root: AnyScreen?, transitionType: TransitionType, animated: Bool, completion: (() -> Void)?) -> AnyObject? {
        
        let confirmationVC = ConfirmationViewController()

        RoutingExecutor.navigate(from: root, to: confirmationVC, transitionType: transitionType, animated: animated, completion: completion)
        
        return confirmationVC
    }
}
