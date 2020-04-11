//
//  Viewer.swift
//  Github-Client
//
//  Created by 日野森寛也 on 2020/04/11.
//  Copyright © 2020 Hiroya Hinomori. All rights reserved.
//

import Foundation

struct Viewer: Hashable, Equatable {
    let id: String
    let avaterImageURL: URL
    let name: String
    let repositories: [Repository]
}
