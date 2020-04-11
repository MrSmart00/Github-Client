//
//  NetworkImage.swift
//  Github-Client
//
//  Created by 日野森寛也 on 2020/04/11.
//  Copyright © 2020 Hiroya Hinomori. All rights reserved.
//

import SwiftUI

struct NetworkImage: View {
    let url: URL?
    @ObservedObject private var downloader = ImageDownloader()

    init(url: URL?) {
        self.url = url
        downloader.fetch(imageURL: url)
    }

    var body: some View {
        if let image = downloader.image {
            return VStack {
                Image(uiImage: image)
                    .resizable()
            }
        } else {
            return VStack {
                Image(uiImage: UIImage(systemName: "icloud.and.arrow.down")!).resizable()
            }
        }
    }
}

private class ImageDownloader: ObservableObject {
    @Published var image: UIImage? = nil

    func fetch(imageURL: URL?) {
        guard let imageURL = imageURL else {
            return
        }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: imageURL, completionHandler: { [weak self] data, _, _ in
            guard let imageData = data,
                let networkImage = UIImage(data: imageData) else {
                    return
            }
            DispatchQueue.main.async {
                self?.image = networkImage
            }
            session.invalidateAndCancel()
        })
        task.resume()
    }
}
