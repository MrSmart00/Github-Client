//
//  SearchView.swift
//  Github-Client
//
//  Created by 日野森寛也 on 2020/04/12.
//  Copyright © 2020 Hiroya Hinomori. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText : String = ""
    @ObservedObject var interactor = SearchInteractor()

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                    .onChangeText {
                        guard !$0.isEmpty else {
                            return
                        }
                        self.interactor.fetch(keyword: $0)
                    }
                List(interactor.results) { repository in
                    NavigationLink(destination: WebView(url: repository.url, title: repository.name)) {
                        RepositoryCell(repository: repository)
                            .frame(height: 90.0)
                    }
                }
                .navigationBarTitle(Text("Search Repository"))
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
