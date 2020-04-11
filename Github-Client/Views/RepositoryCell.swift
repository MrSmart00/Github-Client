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
        RoundedRectangle(cornerRadius: 10)
            .fill(createGradient(colorInfo: repository.language?.color))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(
                VStack(alignment: .leading, spacing: 3.0) {
                    Text(repository.name)
                        .font(.headline)
                    Text(repository.path)
                        .font(.subheadline)
                    HStack(alignment: .center) {
                        Text(repository.language?.name ?? "")
                            .font(.caption)
                        Spacer()
                        Text(repository.updateText)
                            .font(.caption)
                            .foregroundColor(Color.gray)
                    }
                }
                .padding(.horizontal, 10.0)
            )
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
        return .init(gradient: .init(
            colors: [
                Color(red: colorInfo.red,
                      green: colorInfo.green,
                      blue: colorInfo.blue),
                Color(red: ColorInfo.default.red,
                      green: ColorInfo.default.green,
                      blue: ColorInfo.default.blue)
            ]),
                     startPoint: .leading,
                     endPoint: .trailing)
    }
}

struct RepositoryCell_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryCell(repository: .init(id: "",
                                         name: "swift",
                                         isPrivate: false,
                                         updateAt: Date(),
                                         language: .init(name: "C++", color: .init(red: 0.3, green: 0.5, blue: 0.7)),
                                         path: "/apple/swift"))
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
