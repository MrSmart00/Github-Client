//
//  Language.swift
//  Domain
//
//  Created by 日野森寛也 on 2020/04/10.
//  Copyright © 2020 Hiroya Hinomori. All rights reserved.
//

import Foundation

public struct ColorInfo: Hashable, Equatable {
    public init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }

    public let red: Double
    public let green: Double
    public let blue: Double

    public static let `default` = ColorInfo(red: 1, green: 1, blue: 1)
}

public struct Language: Hashable, Equatable {
    public init(name: String, color: ColorInfo) {
        self.name = name
        self.color = color
    }

    public let name: String
    public let color: ColorInfo
}
