//
//  MyRepositoryIntaractor.swift
//  Github-Client
//
//  Created by 日野森寛也 on 2020/04/09.
//  Copyright © 2020 Hiroya Hinomori. All rights reserved.
//

import Foundation
import Apollo

class MyRepositoryInteractor: ObservableObject {
    private let apollo: ApolloClient = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = ["Authorization": "Bearer \(Secret.githubToken)"]
        let url = URL(string: "https://api.github.com/graphql")!
        let transport = HTTPNetworkTransport(url: url,
                                             session: .init(configuration: configuration))
        return .init(networkTransport: transport)
    }()

    @Published var repositories: [Repository] = []

    init() {
        fetch()
    }

    func fetch() {
        apollo.fetch(query: GraphQL.MyRepositoriesQuery()) {
            guard case .success(let response) = $0 else {
                return
            }
            guard let nodes = response.data?.viewer.repositories.nodes else {
                return
            }
            self.repositories = Translator.convert(nodes.compactMap { $0 })
        }
    }
}

extension MyRepositoryInteractor {
    enum Translator {
        static func convert(_ nodes: [GraphQL.MyRepositoriesQuery.Data.Viewer.Repository.Node]) -> [Repository] {
            return nodes.map(convert)
        }

        static func convert(_ node: GraphQL.MyRepositoriesQuery.Data.Viewer.Repository.Node) -> Repository {
            return .init(name: node.name,
                         isPrivate: node.isPrivate,
                         updateAt: Date(),
                         language: node.languages?.nodes?.first?.flatMap(convert))
        }

        static func convert(_ node: GraphQL.MyRepositoriesQuery.Data.Viewer.Repository.Node.Language.Node) -> Language {
            return .init(name: node.name, color: node.color.map(convert) ?? (red: 1, green: 1, blue: 1))
        }

        static func convert(_ hex: String) -> ColorInfo {
            let v = Int("000000" + hex.trimmingCharacters(in: .init(charactersIn: "#")), radix: 16) ?? 0
            let r = Float(v / Int(powf(256, 2)) % 256) / 255
            let g = Float(v / Int(powf(256, 1)) % 256) / 255
            let b = Float(v / Int(powf(256, 0)) % 256) / 255
            return (r, g, b)
        }
    }
}
