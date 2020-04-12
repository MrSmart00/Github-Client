//
//  RepositoryCell.swift
//  Github-Client
//
//  Created by 日野森寛也 on 2020/04/11.
//  Copyright © 2020 Hiroya Hinomori. All rights reserved.
//

import SwiftUI

struct RepositoryCell: View {
    let repository: Repository

    var body: some View {
        VStack(spacing: 3.0) {
            RoundedRectangle(cornerRadius: 10)
                .fill(createGradient(colorInfo: repository.language?.color))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 0.5)
                        .overlay(
                            VStack(alignment: .leading, spacing: 3.0) {
                                HStack {
                                    Text(repository.name)
                                        .font(.title)
                                    Spacer()
                                }
                                HStack(alignment: .center) {
                                    Text(repository.path)
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                    Spacer()
                                    Text(repository.language?.name ?? "")
                                        .font(.caption)
                                }
                            }
                            .padding(.horizontal, 10.0)
                        )
                )
            HStack {
                Spacer()
                Text(repository.updateText)
                    .font(.caption)
                    .foregroundColor(Color.gray)
            }
        }

    }

    private func createGradient(colorInfo: ColorInfo?) -> LinearGradient {
        guard let colorInfo = colorInfo else {
            return .init(
                gradient: .init(
                    colors: [
                        Color(red: ColorInfo.default.red, green: ColorInfo.default.green, blue: ColorInfo.default.blue)
                    ]),
                startPoint: .leading,
                endPoint: .trailing)
        }
        return .init(
            gradient: .init(
                colors: [
                    Color(.sRGB,
                          red: colorInfo.red,
                          green: colorInfo.green,
                          blue: colorInfo.blue,
                          opacity: 0.5),
                    Color(.sRGB,
                          red: ColorInfo.default.red,
                          green: ColorInfo.default.green,
                          blue: ColorInfo.default.blue,
                          opacity: 0.5)
                ]),
            startPoint: .leading,
            endPoint: .center)
    }
}

struct RepositoryCell_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RepositoryCell(repository: .init(id: "",
                                             name: "Github-Client",
                                             isPrivate: false,
                                             updateAt: Date(),
                                             language: .init(name: "Swift", color: .init(red: 0.3, green: 0.5, blue: 0.7)),
                                             path: "/MrSmart00/Github-Client",
                                             url: URL(string: "https://www.apple.com/jp/")!))
            RepositoryCell(repository: .init(id: "",
                                             name: "swift",
                                             isPrivate: false,
                                             updateAt: Date(),
                                             language: .init(name: "C++", color: .init(red: 1, green: 1, blue: 1)),
                                             path: "/apple/swift",
                                             url: URL(string: "https://www.apple.com/jp/")!))

        }
            .previewLayout(.fixed(width: 300, height: 90))
    }
}
