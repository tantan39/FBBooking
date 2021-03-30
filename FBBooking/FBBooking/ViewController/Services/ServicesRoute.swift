//
//  ServicesRoute.swift
//  FBBooking
//
//  Created by Tan Tan on 3/30/21.
//

import UIKit

class ServicesRoute: Router {
    func navigate(from root: AnyScreen?, transitionType: TransitionType, animated: Bool, completion: (() -> Void)?) -> AnyObject? {
        
        let servicesVC = ServicesViewController()
        RoutingExecutor.navigate(from: root, to: servicesVC, transitionType: transitionType, animated: animated, completion: completion)
        
        return servicesVC
    }
}
