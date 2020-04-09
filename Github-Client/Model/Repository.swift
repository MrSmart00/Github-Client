//
//  Repository.swift
//  Github-Client
//
//  Created by 日野森寛也 on 2020/04/10.
//  Copyright © 2020 Hiroya Hinomori. All rights reserved.
//

import Foundation

struct Repository {
    let name: String
    let isPrivate: Bool
    let updateAt: Date
    let language: Language?
}
