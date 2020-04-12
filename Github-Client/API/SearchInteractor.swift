//
//  SearchInteractor.swift
//  Github-Client
//
//  Created by 日野森寛也 on 2020/04/12.
//  Copyright © 2020 Hiroya Hinomori. All rights reserved.
//

import Foundation
import Apollo

class SearchInteractor: ObservableObject {
    private let apollo: ApolloClient = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = ["Authorization": "Bearer \(Secret.githubToken)"]
        let url = URL(string: "https://api.github.com/graphql")!
        let transport = HTTPNetworkTransport(url: url,
                                             session: .init(configuration: configuration))
        return .init(networkTransport: transport)
    }()

    @Published var results: [Repository] = []

    func fetch(keyword: String) {
        apollo.fetch(query: GraphQL.SearchRepositoryQuery(keyward: keyword, count: 50)) {
            guard case .success(let response) = $0, let nodes = response.data?.search.nodes else {
                return
            }
            let compactedNodes = nodes.compactMap { $0 }
            self.results = Translator.convert(compactedNodes)
        }
    }
}

extension SearchInteractor {
    enum Translator {
        static func convert(_ nodes: [GraphQL.SearchRepositoryQuery.Data.Search.Node]) -> [Repository] {
            return nodes.map(convert)
        }

        static func convert(_ node: GraphQL.SearchRepositoryQuery.Data.Search.Node) -> Repository {
            let repository = node.asRepository!
            return .init(id: repository.id,
                         name: repository.name,
                         isPrivate: repository.isPrivate,
                         updateAt: convert(repository.updatedAt),
                         language: repository.languages?.nodes?.first?.flatMap(convert),
                         path: repository.resourcePath,
                         url: URL(string: repository.url)!)
        }

        static func convert(_ node: GraphQL.SearchRepositoryQuery.Data.Search.Node.AsRepository.Language.Node) -> Language {
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
