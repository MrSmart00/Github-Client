//
//  RepositoryList.swift
//  Github-Client
//
//  Created by 日野森寛也 on 2020/04/11.
//  Copyright © 2020 Hiroya Hinomori. All rights reserved.
//

import SwiftUI

struct RepositoryList: View {
    @ObservedObject var interactor = MyRepositoryInteractor()

    var body: some View {
        NavigationView {
            List(interactor.viewer?.repositories ?? []) { repository in
                NavigationLink(destination: WebView(url: repository.url, title: repository.name)) {
                    RepositoryCell(repository: repository)
                        .frame(height: 90.0)
                }
            }
            .onAppear { UITableView.appearance().separatorColor = .clear }
            .onDisappear { UITableView.appearance().separatorStyle = .singleLine }
            .navigationBarItems(
                leading: NetworkImage(url: interactor.viewer?.avaterImageURL)
                    .frame(width: 32, height: 32)
                    .cornerRadius(22)
            )
            .navigationBarTitle(Text(interactor.viewer?.name ?? "Hello, World!"))
        }
    }
}

struct RepositoryList_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryList()
    }
}
