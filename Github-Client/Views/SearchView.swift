//
//  SearchView.swift
//  Github-Client
//
//  Created by 日野森寛也 on 2020/04/12.
//  Copyright © 2020 Hiroya Hinomori. All rights reserved.
//

import SwiftUI

struct SearchView<Presentation: SearchPresentation>: View {
    @State private var searchText : String = ""
    @ObservedObject var presentation: Presentation

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                    .onChangeText { self.presentation.start(keyward: $0) }
                List(presentation.results) { repository in
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
        SearchView<SearchPresenter<SearchInteractor>>(presentation: .init(usecase: .init()))
    }
}
