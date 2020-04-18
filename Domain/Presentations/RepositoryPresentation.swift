//
//  RepositoryPresentation.swift
//  Domain
//
//  Created by 日野森寛也 on 2020/04/18.
//

import Foundation

public protocol RepositoryListPresentation: ObservableObject {
    var results: [Repository] { get }
    var name: String { get }
    var avaterImageURL: URL? { get }

    func start()
}
