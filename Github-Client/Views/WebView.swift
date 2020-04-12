//
//  WebView.swift
//  Github-Client
//
//  Created by 日野森寛也 on 2020/04/12.
//  Copyright © 2020 Hiroya Hinomori. All rights reserved.
//

import SwiftUI
import WebKit

struct WKUIWebView : UIViewRepresentable {
    var url: URL

    func makeUIView(context: Context) -> WKWebView  {
        return WKWebView(frame: .zero)
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let req = URLRequest(url: url)
        uiView.load(req)
    }
}

struct WebView: View {
    let url: URL
    let title: String

    var body: some View {
        VStack {
            WKUIWebView(url: url)
        }
        .navigationBarTitle(Text(title), displayMode: .inline)
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(url: URL(string: "https://www.apple.com/jp/")!, title: "Apple")
    }
}
