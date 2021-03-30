//
//  Services.swift
//  FBBooking
//
//  Created by Tan Tan on 3/30/21.
//

import Foundation

protocol ServicesProtocol {
    var title: String? { get set }
    var description: String? { get set }
    var price: Double? { get set }
    var duration: Double? { get set }
}
