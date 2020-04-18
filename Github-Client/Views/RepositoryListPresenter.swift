//
//  RepositoryListPresenter.swift
//  Github-Client
//
//  Created by 日野森寛也 on 2020/04/18.
//

import Foundation
import SwiftUI
import Combine

protocol RepositoryListPresentation: ObservableObject {
    var results: [Repository] { get }
    var name: String { get }
    var avaterImageURL: URL? { get }
    func start()
}

class RepositoryListPresenter<Usecase: RepositoryUsecase>: RepositoryListPresentation {
    @ObservedObject private var usecase: Usecase
    @Published var results: [Repository] = []
    @Published var name: String = ""
    @Published var avaterImageURL: URL? = nil

    private var cancellables: [AnyCancellable] = []

    init(usecase: Usecase) {
        self.usecase = usecase
    }

    func start() {
        usecase
            .fetch()
            .sink { [weak self] in
                self?.results = $0.repositories
                self?.name = $0.name
                self?.avaterImageURL = $0.avaterImageURL
            }
            .store(in: &cancellables)
    }
}
