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
            List(interactor.repositories) {
                RepositoryCell(repository: $0)
                    .frame(height: 70.0)
            }
            .onAppear { UITableView.appearance().separatorColor = .clear }
            .onDisappear { UITableView.appearance().separatorStyle = .singleLine }
            .navigationBarTitle(Text("Hello, World!"))
        }
    }
}

struct RepositoryList_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryList()
    }
}
