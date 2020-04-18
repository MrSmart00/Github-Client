//
//  Repository.swift
//  Domain
//
//  Created by 日野森寛也 on 2020/04/10.
//  Copyright © 2020 Hiroya Hinomori. All rights reserved.
//

import Foundation

public struct Repository: Hashable, Identifiable, Equatable {
    public init(id: String, name: String, isPrivate: Bool, updateAt: Date, language: Language?, path: String, url: URL) {
        self.id = id
        self.name = name
        self.isPrivate = isPrivate
        self.updateAt = updateAt
        self.language = language
        self.path = path
        self.url = url
    }

    public let id: String
    public let name: String
    public let isPrivate: Bool
    public let updateAt: Date
    public let language: Language?
    public let path: String
    public let url: URL

    public var updateText: String {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .long
        formatter.locale = .init(identifier: "ja_JP")
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        return formatter.string(from: updateAt)
    }
}
