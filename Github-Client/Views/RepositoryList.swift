//
//  RepositoryList.swift
//  Github-Client
//
//  Created by 日野森寛也 on 2020/04/11.
//  Copyright © 2020 Hiroya Hinomori. All rights reserved.
//

import SwiftUI

struct RepositoryList<Presentation: RepositoryListPresentation>: View {
    @ObservedObject var presentation: Presentation

    var body: some View {
        NavigationView {
            List(presentation.results) { repository in
                NavigationLink(destination: WebView(url: repository.url, title: repository.name)) {
                    RepositoryCell(repository: repository)
                        .frame(height: 90.0)
                }
            }
            .onAppear { UITableView.appearance().separatorColor = .clear }
            .onDisappear { UITableView.appearance().separatorStyle = .singleLine }
            .navigationBarItems(
                leading: NetworkImage(url: presentation.avaterImageURL)
                    .frame(width: 32, height: 32)
                    .cornerRadius(22)
            )
            .navigationBarTitle(Text(presentation.name))
        }
        .onAppear(perform: { self.presentation.start() })
    }
}

struct RepositoryList_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryList<RepositoryListPresenter<MyRepositoryInteractor>>(presentation: RepositoryListPresenter<MyRepositoryInteractor>(usecase: .init()))
    }
}
