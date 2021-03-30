//
//  ScheduleRoute.swift
//  FBBooking
//
//  Created by Tan Tan on 3/30/21.
//

import UIKit

class ScheduleRoute: Router {
    
    func navigate(from root: AnyScreen?, transitionType: TransitionType, animated: Bool, completion: (() -> Void)?) -> AnyObject? {
        
        let scheduleVC = ScheduleApptViewController()
        RoutingExecutor.navigate(from: root, to: scheduleVC, transitionType: transitionType, animated: animated, completion: completion)
        return scheduleVC
    }
}
