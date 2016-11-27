//
// Copyright (c) 2016 Commercetools. All rights reserved.
//

import ObjectMapper

public struct ProductDiscountValue: Mappable {

    // MARK: - Properties

    public var type: String?
    public var permyriad: Int?
    public var money: Money?

    public init?(map: Map) {}

    // MARK: - Mappable

    mutating public func mapping(map: Map) {
        type            <- map["type"]
        permyriad       <- map["permyriad"]
        money           <- map["money"]
    }
}