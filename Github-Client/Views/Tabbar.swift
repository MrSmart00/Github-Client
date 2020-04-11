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
            RepositoryList()
                .tabItem {
                    VStack {
                        Image(systemName: "a")
                        Text("My Repository")
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
