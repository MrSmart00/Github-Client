//
//  SearchPresenter.swift
//  Github-Client
//
//  Created by 日野森寛也 on 2020/04/18.
//

import Foundation
import SwiftUI
import Combine
import Domain

class SearchPresenter<Usecase: SearchUsecase>: SearchPresentation {
    private var usecase: Usecase
    @Published var results: [Repository] = []

    private var cancellables: [AnyCancellable] = []

    init(usecase: Usecase) {
        self.usecase = usecase
    }

    func start(keyward: String) {
        guard !keyward.isEmpty else {
            return
        }
        usecase
            .fetch(keyword: keyward)
            .sink { [weak self] in
                self?.results = $0
            }
            .store(in: &cancellables)
    }
}
