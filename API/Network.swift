//
//  Network.swift
//  API
//
//  Created by 日野森寛也 on 2020/04/18.
//

import Foundation
import Apollo

public enum Network {
    public static func generateClient() -> ApolloClient {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = ["Authorization": "Bearer \(Secret.githubToken)"]
        return .init(networkTransport: HTTPNetworkTransport(url: URL(string: "https://api.github.com/graphql")!,
                                                            session: .init(configuration: configuration)))
    }
}
