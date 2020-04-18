//
//  MyRepositoryIntaractor.swift
//  Github-Client
//
//  Created by 日野森寛也 on 2020/04/09.
//  Copyright © 2020 Hiroya Hinomori. All rights reserved.
//

import Foundation
import Apollo
import Combine

protocol RepositoryUsecase: ObservableObject {
    func fetch() -> Future<Viewer, Never>
}

class MyRepositoryInteractor: RepositoryUsecase {
    private let apollo: ApolloClient = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = ["Authorization": "Bearer \(Secret.githubToken)"]
        let url = URL(string: "https://api.github.com/graphql")!
        let transport = HTTPNetworkTransport(url: url,
                                             session: .init(configuration: configuration))
        return .init(networkTransport: transport)
    }()

    func fetch() -> Future<Viewer, Never> {
        return Future<Viewer, Never> { [unowned self] promise in
            self.apollo.fetch(query: GraphQL.MyRepositoriesQuery()) {
                guard case .success(let response) = $0, let viewer = response.data?.viewer else {
                    return
                }
                promise(.success(Translator.convert(viewer)))
            }
        }
    }
}

extension MyRepositoryInteractor {
    enum Translator {
        static func convert(_ viewer: GraphQL.MyRepositoriesQuery.Data.Viewer) -> Viewer {
            let nodes = viewer.repositories.nodes?.compactMap { $0 } ?? []
            return Viewer(id: viewer.id,
                         avaterImageURL: URL(string: viewer.avatarUrl)!,
                         name: viewer.login,
                         repositories: nodes.map(convert))
        }

        static func convert(_ nodes: [GraphQL.MyRepositoriesQuery.Data.Viewer.Repository.Node]) -> [Repository] {
            return nodes.map(convert)
        }

        static func convert(_ node: GraphQL.MyRepositoriesQuery.Data.Viewer.Repository.Node) -> Repository {
            return .init(id: node.id,
                         name: node.name,
                         isPrivate: node.isPrivate,
                         updateAt: convert(node.updatedAt),
                         language: node.languages?.nodes?.first?.flatMap(convert),
                         path: node.resourcePath,
                         url: URL(string: node.url)!)
        }

        static func convert(_ node: GraphQL.MyRepositoriesQuery.Data.Viewer.Repository.Node.Language.Node) -> Language {
            return .init(name: node.name, color: node.color.map(convert) ?? .default)
        }

        static func convert(_ date: String) -> Date {
            let formatter: DateFormatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ" // 2020-04-10T16:34:46Z
            return formatter.date(from: date)!
        }

        static func convert(_ hex: String) -> ColorInfo {
            let v = Int("000000" + hex.trimmingCharacters(in: .init(charactersIn: "#")), radix: 16) ?? 0
            let r = Double(v / Int(powf(256, 2)) % 256) / 255
            let g = Double(v / Int(powf(256, 1)) % 256) / 255
            let b = Double(v / Int(powf(256, 0)) % 256) / 255
            return .init(red: r, green: g, blue: b)
        }
    }
}
