//
//  Merchant.swift
//  FBBooking
//
//  Created by Tan Tan on 3/30/21.
//

import Foundation

protocol MerchantProtocol {
    var title: String? { get set }
    var address: String? { get set }
    var distance: Double? { get set }
    var url: String? { get set }
}
