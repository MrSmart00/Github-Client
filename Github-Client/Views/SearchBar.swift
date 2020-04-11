//
//  SearchBar.swift
//  Github-Client
//
//  Created by 日野森寛也 on 2020/04/12.
//  Copyright © 2020 Hiroya Hinomori. All rights reserved.
//

import SwiftUI

final class SearchBar: UIViewRepresentable {
    @Binding var text: String
    var changedAction: ((String) -> Void)? = nil

    class Coordinator: NSObject, UISearchBarDelegate {

        @Binding var text: String
        var changedAction: ((String) -> Void)? = nil

        init(text: Binding<String>, action: ((String) -> Void)? = nil) {
            _text = text
            changedAction = action
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }

        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            changedAction?(text)
            UIApplication.shared.endEditing()
        }
    }

    init(text: Binding<String>) {
        self._text = text
    }

    func makeCoordinator() -> SearchBar.Coordinator {
        return Coordinator(text: $text, action: changedAction)
    }

    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.searchBarStyle = .minimal
        searchBar.autocapitalizationType = .none
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
    }

    func onChangeText(perform action: ((String) -> Void)? = nil) -> some View {
        changedAction = action
        return self
    }
}
