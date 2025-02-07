//
//  Tabbar.swift
//  Github-Client
//
//  Created by 日野森寛也 on 2020/04/12.
//  Copyright © 2020 Hiroya Hinomori. All rights reserved.
//

import SwiftUI

struct Tabbar: View {
    var body: some View {
        TabView {
            RepositoryList<RepositoryListPresenter<MyRepositoryInteractor>>(presentation: RepositoryListPresenter<MyRepositoryInteractor>(usecase: .init()))
                .tabItem {
                    VStack {
                        Text("My Repository")
                    }
                }
            SearchView<SearchPresenter<SearchInteractor>>(presentation: .init(usecase: .init()))
                .tabItem {
                    VStack {
                        Text("Search")
                    }
                }
        }
    }
}

struct Tabbar_Previews: PreviewProvider {
    static var previews: some View {
        Tabbar()
    }
}
