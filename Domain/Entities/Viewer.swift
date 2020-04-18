//
//  Viewer.swift
//  Domain
//
//  Created by 日野森寛也 on 2020/04/11.
//  Copyright © 2020 Hiroya Hinomori. All rights reserved.
//

import Foundation

public struct Viewer: Hashable, Equatable {
    public init(id: String, avaterImageURL: URL, name: String, repositories: [Repository]) {
        self.id = id
        self.avaterImageURL = avaterImageURL
        self.name = name
        self.repositories = repositories
    }

    public let id: String
    public let avaterImageURL: URL
    public let name: String
    public let repositories: [Repository]
}
