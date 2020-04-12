// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// GraphQL namespace
public enum GraphQL {
  public final class MyRepositoriesQuery: GraphQLQuery {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      query MyRepositories {
        viewer {
          __typename
          avatarUrl(size: 128)
          id
          login
          repositories(first: 100, orderBy: {field: CREATED_AT, direction: DESC}) {
            __typename
            nodes {
              __typename
              id
              name
              resourcePath
              isPrivate
              updatedAt
              url
              languages(first: 1, orderBy: {field: SIZE, direction: DESC}) {
                __typename
                nodes {
                  __typename
                  color
                  name
                }
              }
            }
          }
        }
      }
      """

    public let operationName: String = "MyRepositories"

    public init() {
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Query"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("viewer", type: .nonNull(.object(Viewer.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(viewer: Viewer) {
        self.init(unsafeResultMap: ["__typename": "Query", "viewer": viewer.resultMap])
      }

      /// The currently authenticated user.
      public var viewer: Viewer {
        get {
          return Viewer(unsafeResultMap: resultMap["viewer"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "viewer")
        }
      }

      public struct Viewer: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("avatarUrl", arguments: ["size": 128], type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("login", type: .nonNull(.scalar(String.self))),
          GraphQLField("repositories", arguments: ["first": 100, "orderBy": ["field": "CREATED_AT", "direction": "DESC"]], type: .nonNull(.object(Repository.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(avatarUrl: String, id: GraphQLID, login: String, repositories: Repository) {
          self.init(unsafeResultMap: ["__typename": "User", "avatarUrl": avatarUrl, "id": id, "login": login, "repositories": repositories.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// A URL pointing to the user's public avatar.
        public var avatarUrl: String {
          get {
            return resultMap["avatarUrl"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "avatarUrl")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        /// The username used to login.
        public var login: String {
          get {
            return resultMap["login"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "login")
          }
        }

        /// A list of repositories that the user owns.
        public var repositories: Repository {
          get {
            return Repository(unsafeResultMap: resultMap["repositories"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "repositories")
          }
        }

        public struct Repository: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["RepositoryConnection"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("nodes", type: .list(.object(Node.selections))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(nodes: [Node?]? = nil) {
            self.init(unsafeResultMap: ["__typename": "RepositoryConnection", "nodes": nodes.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// A list of nodes.
          public var nodes: [Node?]? {
            get {
              return (resultMap["nodes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Node?] in value.map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } } }
            }
            set {
              resultMap.updateValue(newValue.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, forKey: "nodes")
            }
          }

          public struct Node: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Repository"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
              GraphQLField("resourcePath", type: .nonNull(.scalar(String.self))),
              GraphQLField("isPrivate", type: .nonNull(.scalar(Bool.self))),
              GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
              GraphQLField("url", type: .nonNull(.scalar(String.self))),
              GraphQLField("languages", arguments: ["first": 1, "orderBy": ["field": "SIZE", "direction": "DESC"]], type: .object(Language.selections)),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: GraphQLID, name: String, resourcePath: String, isPrivate: Bool, updatedAt: String, url: String, languages: Language? = nil) {
              self.init(unsafeResultMap: ["__typename": "Repository", "id": id, "name": name, "resourcePath": resourcePath, "isPrivate": isPrivate, "updatedAt": updatedAt, "url": url, "languages": languages.flatMap { (value: Language) -> ResultMap in value.resultMap }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: GraphQLID {
              get {
                return resultMap["id"]! as! GraphQLID
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            /// The name of the repository.
            public var name: String {
              get {
                return resultMap["name"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }

            /// The HTTP path for this repository
            public var resourcePath: String {
              get {
                return resultMap["resourcePath"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "resourcePath")
              }
            }

            /// Identifies if the repository is private.
            public var isPrivate: Bool {
              get {
                return resultMap["isPrivate"]! as! Bool
              }
              set {
                resultMap.updateValue(newValue, forKey: "isPrivate")
              }
            }

            /// Identifies the date and time when the object was last updated.
            public var updatedAt: String {
              get {
                return resultMap["updatedAt"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "updatedAt")
              }
            }

            /// The HTTP URL for this repository
            public var url: String {
              get {
                return resultMap["url"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "url")
              }
            }

            /// A list containing a breakdown of the language composition of the repository.
            public var languages: Language? {
              get {
                return (resultMap["languages"] as? ResultMap).flatMap { Language(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "languages")
              }
            }

            public struct Language: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["LanguageConnection"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("nodes", type: .list(.object(Node.selections))),
              ]

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(nodes: [Node?]? = nil) {
                self.init(unsafeResultMap: ["__typename": "LanguageConnection", "nodes": nodes.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// A list of nodes.
              public var nodes: [Node?]? {
                get {
                  return (resultMap["nodes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Node?] in value.map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } } }
                }
                set {
                  resultMap.updateValue(newValue.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, forKey: "nodes")
                }
              }

              public struct Node: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Language"]

                public static let selections: [GraphQLSelection] = [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("color", type: .scalar(String.self)),
                  GraphQLField("name", type: .nonNull(.scalar(String.self))),
                ]

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(color: String? = nil, name: String) {
                  self.init(unsafeResultMap: ["__typename": "Language", "color": color, "name": name])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The color defined for the current language.
                public var color: String? {
                  get {
                    return resultMap["color"] as? String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "color")
                  }
                }

                /// The name of the current language.
                public var name: String {
                  get {
                    return resultMap["name"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "name")
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  public final class SearchRepositoryQuery: GraphQLQuery {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      query SearchRepository($keyward: String!, $count: Int!) {
        search(type: REPOSITORY, query: $keyward, first: $count) {
          __typename
          nodes {
            __typename
            ... on Repository {
              id
              name
              resourcePath
              isPrivate
              updatedAt
              url
              languages(first: 1, orderBy: {field: SIZE, direction: DESC}) {
                __typename
                nodes {
                  __typename
                  name
                  color
                }
              }
              owner {
                __typename
                id
                avatarUrl(size: 120)
                login
              }
            }
          }
        }
      }
      """

    public let operationName: String = "SearchRepository"

    public var keyward: String
    public var count: Int

    public init(keyward: String, count: Int) {
      self.keyward = keyward
      self.count = count
    }

    public var variables: GraphQLMap? {
      return ["keyward": keyward, "count": count]
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Query"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("search", arguments: ["type": "REPOSITORY", "query": GraphQLVariable("keyward"), "first": GraphQLVariable("count")], type: .nonNull(.object(Search.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(search: Search) {
        self.init(unsafeResultMap: ["__typename": "Query", "search": search.resultMap])
      }

      /// Perform a search across resources.
      public var search: Search {
        get {
          return Search(unsafeResultMap: resultMap["search"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "search")
        }
      }

      public struct Search: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["SearchResultItemConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("nodes", type: .list(.object(Node.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(nodes: [Node?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "SearchResultItemConnection", "nodes": nodes.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// A list of nodes.
        public var nodes: [Node?]? {
          get {
            return (resultMap["nodes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Node?] in value.map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, forKey: "nodes")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["App", "Issue", "MarketplaceListing", "Organization", "PullRequest", "Repository", "User"]

          public static let selections: [GraphQLSelection] = [
            GraphQLTypeCase(
              variants: ["Repository": AsRepository.selections],
              default: [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              ]
            )
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public static func makeApp() -> Node {
            return Node(unsafeResultMap: ["__typename": "App"])
          }

          public static func makeIssue() -> Node {
            return Node(unsafeResultMap: ["__typename": "Issue"])
          }

          public static func makeMarketplaceListing() -> Node {
            return Node(unsafeResultMap: ["__typename": "MarketplaceListing"])
          }

          public static func makeOrganization() -> Node {
            return Node(unsafeResultMap: ["__typename": "Organization"])
          }

          public static func makePullRequest() -> Node {
            return Node(unsafeResultMap: ["__typename": "PullRequest"])
          }

          public static func makeUser() -> Node {
            return Node(unsafeResultMap: ["__typename": "User"])
          }

          public static func makeRepository(id: GraphQLID, name: String, resourcePath: String, isPrivate: Bool, updatedAt: String, url: String, languages: AsRepository.Language? = nil, owner: AsRepository.Owner) -> Node {
            return Node(unsafeResultMap: ["__typename": "Repository", "id": id, "name": name, "resourcePath": resourcePath, "isPrivate": isPrivate, "updatedAt": updatedAt, "url": url, "languages": languages.flatMap { (value: AsRepository.Language) -> ResultMap in value.resultMap }, "owner": owner.resultMap])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var asRepository: AsRepository? {
            get {
              if !AsRepository.possibleTypes.contains(__typename) { return nil }
              return AsRepository(unsafeResultMap: resultMap)
            }
            set {
              guard let newValue = newValue else { return }
              resultMap = newValue.resultMap
            }
          }

          public struct AsRepository: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Repository"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
              GraphQLField("resourcePath", type: .nonNull(.scalar(String.self))),
              GraphQLField("isPrivate", type: .nonNull(.scalar(Bool.self))),
              GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
              GraphQLField("url", type: .nonNull(.scalar(String.self))),
              GraphQLField("languages", arguments: ["first": 1, "orderBy": ["field": "SIZE", "direction": "DESC"]], type: .object(Language.selections)),
              GraphQLField("owner", type: .nonNull(.object(Owner.selections))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: GraphQLID, name: String, resourcePath: String, isPrivate: Bool, updatedAt: String, url: String, languages: Language? = nil, owner: Owner) {
              self.init(unsafeResultMap: ["__typename": "Repository", "id": id, "name": name, "resourcePath": resourcePath, "isPrivate": isPrivate, "updatedAt": updatedAt, "url": url, "languages": languages.flatMap { (value: Language) -> ResultMap in value.resultMap }, "owner": owner.resultMap])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: GraphQLID {
              get {
                return resultMap["id"]! as! GraphQLID
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            /// The name of the repository.
            public var name: String {
              get {
                return resultMap["name"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }

            /// The HTTP path for this repository
            public var resourcePath: String {
              get {
                return resultMap["resourcePath"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "resourcePath")
              }
            }

            /// Identifies if the repository is private.
            public var isPrivate: Bool {
              get {
                return resultMap["isPrivate"]! as! Bool
              }
              set {
                resultMap.updateValue(newValue, forKey: "isPrivate")
              }
            }

            /// Identifies the date and time when the object was last updated.
            public var updatedAt: String {
              get {
                return resultMap["updatedAt"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "updatedAt")
              }
            }

            /// The HTTP URL for this repository
            public var url: String {
              get {
                return resultMap["url"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "url")
              }
            }

            /// A list containing a breakdown of the language composition of the repository.
            public var languages: Language? {
              get {
                return (resultMap["languages"] as? ResultMap).flatMap { Language(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "languages")
              }
            }

            /// The User owner of the repository.
            public var owner: Owner {
              get {
                return Owner(unsafeResultMap: resultMap["owner"]! as! ResultMap)
              }
              set {
                resultMap.updateValue(newValue.resultMap, forKey: "owner")
              }
            }

            public struct Language: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["LanguageConnection"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("nodes", type: .list(.object(Node.selections))),
              ]

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(nodes: [Node?]? = nil) {
                self.init(unsafeResultMap: ["__typename": "LanguageConnection", "nodes": nodes.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// A list of nodes.
              public var nodes: [Node?]? {
                get {
                  return (resultMap["nodes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Node?] in value.map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } } }
                }
                set {
                  resultMap.updateValue(newValue.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, forKey: "nodes")
                }
              }

              public struct Node: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Language"]

                public static let selections: [GraphQLSelection] = [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("name", type: .nonNull(.scalar(String.self))),
                  GraphQLField("color", type: .scalar(String.self)),
                ]

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(name: String, color: String? = nil) {
                  self.init(unsafeResultMap: ["__typename": "Language", "name": name, "color": color])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The name of the current language.
                public var name: String {
                  get {
                    return resultMap["name"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "name")
                  }
                }

                /// The color defined for the current language.
                public var color: String? {
                  get {
                    return resultMap["color"] as? String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "color")
                  }
                }
              }
            }

            public struct Owner: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["Organization", "User"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                GraphQLField("avatarUrl", arguments: ["size": 120], type: .nonNull(.scalar(String.self))),
                GraphQLField("login", type: .nonNull(.scalar(String.self))),
              ]

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public static func makeOrganization(id: GraphQLID, avatarUrl: String, login: String) -> Owner {
                return Owner(unsafeResultMap: ["__typename": "Organization", "id": id, "avatarUrl": avatarUrl, "login": login])
              }

              public static func makeUser(id: GraphQLID, avatarUrl: String, login: String) -> Owner {
                return Owner(unsafeResultMap: ["__typename": "User", "id": id, "avatarUrl": avatarUrl, "login": login])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var id: GraphQLID {
                get {
                  return resultMap["id"]! as! GraphQLID
                }
                set {
                  resultMap.updateValue(newValue, forKey: "id")
                }
              }

              /// A URL pointing to the owner's public avatar.
              public var avatarUrl: String {
                get {
                  return resultMap["avatarUrl"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "avatarUrl")
                }
              }

              /// The username used to login.
              public var login: String {
                get {
                  return resultMap["login"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "login")
                }
              }
            }
          }
        }
      }
    }
  }
}
