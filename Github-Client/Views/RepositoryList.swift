//
//  RepositoryList.swift
//  Github-Client
//
//  Created by 日野森寛也 on 2020/04/11.
//  Copyright © 2020 Hiroya Hinomori. All rights reserved.
//

import SwiftUI

struct RepositoryList<Presenter: RepositoryListPresentation>: View {
    @ObservedObject var presenter: Presenter

    var body: some View {
        NavigationView {
            List(presenter.results) { repository in
                NavigationLink(destination: WebView(url: repository.url, title: repository.name)) {
                    RepositoryCell(repository: repository)
                        .frame(height: 90.0)
                }
            }
            .onAppear { UITableView.appearance().separatorColor = .clear }
            .onDisappear { UITableView.appearance().separatorStyle = .singleLine }
            .navigationBarItems(
                leading: NetworkImage(url: presenter.avaterImageURL)
                    .frame(width: 32, height: 32)
                    .cornerRadius(22)
            )
            .navigationBarTitle(Text(presenter.name))
        }
        .onAppear(perform: { self.presenter.start() })
    }
}

struct RepositoryList_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryList<RepositoryListPresenter<MyRepositoryInteractor>>(presenter: RepositoryListPresenter<MyRepositoryInteractor>(usecase: .init()))
    }
}
