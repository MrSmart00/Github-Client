//
//  ContentView.swift
//  Github-Client
//
//  Created by 日野森寛也 on 2020/04/08.
//  Copyright © 2020 Hiroya Hinomori. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    let exam = Exam()

    var body: some View {
        Text("Hello, World!")
            .onAppear {
                self.exam.sink()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class Exam {
    @ObservedObject var interactor = MyRepositoryInteractor()
    var cancellables: [AnyCancellable] = []

    func sink() {
        interactor.$repositories.sink {
            $0.forEach {
                print($0)
            }
        }
        .store(in: &cancellables)
    }
}
