//
//  ServicesRoute.swift
//  FBBooking
//
//  Created by Tan Tan on 3/30/21.
//

import UIKit
import Pulley
class ServicesRoute: Router {
    func navigate(from root: AnyScreen?, transitionType: TransitionType, animated: Bool, completion: (() -> Void)?) -> AnyObject? {
        
        let servicesVC = ServicesViewController()
        let staffVC = StaffsViewController()
        
        let pulleyVC = PulleyViewController(contentViewController: UINavigationController(rootViewController: servicesVC), drawerViewController: staffVC)
//        pulleyVC.setDrawerPosition(position: .closed, animated: true)
//        
//        pulleyVC.initialDrawerPosition = .closed
//        pulleyVC.setNeedsSupportedDrawerPositionsUpdate()
        
        RoutingExecutor.navigate(from: root, to: pulleyVC, transitionType: transitionType, animated: animated, completion: completion)
        
        return servicesVC
    }
}
