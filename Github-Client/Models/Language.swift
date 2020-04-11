//
//  Language.swift
//  Github-Client
//
//  Created by 日野森寛也 on 2020/04/10.
//  Copyright © 2020 Hiroya Hinomori. All rights reserved.
//

import Foundation

struct ColorInfo: Hashable, Equatable {
    let red: Double
    let green: Double
    let blue: Double

    static let `default` = ColorInfo(red: 1, green: 1, blue: 1)
}

struct Language: Hashable, Equatable {
    let name: String
    let color: ColorInfo
}
