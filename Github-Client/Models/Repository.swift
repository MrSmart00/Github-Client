//
//  Repository.swift
//  Github-Client
//
//  Created by 日野森寛也 on 2020/04/10.
//  Copyright © 2020 Hiroya Hinomori. All rights reserved.
//

import Foundation

struct Repository: Hashable, Identifiable, Equatable {
    let id: String
    let name: String
    let isPrivate: Bool
    let updateAt: Date
    let language: Language?
    let path: String
    let url: URL

    var updateText: String {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .long
        formatter.locale = .init(identifier: "ja_JP")
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        return formatter.string(from: updateAt)
    }
}
