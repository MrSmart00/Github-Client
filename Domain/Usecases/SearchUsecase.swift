//
//  SearchUsecase.swift
//  Domain
//
//  Created by 日野森寛也 on 2020/04/18.
//

import Foundation
import Combine

public protocol SearchUsecase: ObservableObject {
    func fetch(keyword: String) -> Future<[Repository], Never>
}
