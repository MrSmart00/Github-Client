//
//  RepositoryListViewModel.swift
//  Github-Client
//
//  Created by 日野森寛也 on 2020/04/18.
//

import Foundation
import SwiftUI
import Combine

class RepositoryListViewModel: ObservableObject {
    @ObservedObject private var interactor: MyRepositoryInteractor
    @Published var results: [Repository] = []
    @Published var name: String = ""
    @Published var avaterImageURL: URL? = nil

    private var cancellables: [AnyCancellable] = []

    init(interactor: MyRepositoryInteractor) {
        self.interactor = interactor
    }

    func fetch() {
        interactor
            .fetch()
            .sink { [weak self] in
                self?.results = $0.repositories
                self?.name = $0.name
                self?.avaterImageURL = $0.avaterImageURL
            }
            .store(in: &cancellables)
    }
}
