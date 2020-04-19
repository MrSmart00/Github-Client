//
//  SearchPresentation.swift
//  Domain
//
//  Created by 日野森寛也 on 2020/04/18.
//

import Foundation

public protocol SearchPresentation: ObservableObject {
    var results: [Repository] { get }
    func start(keyward: String)
}
