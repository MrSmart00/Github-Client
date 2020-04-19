# Github-Client
![Swift](https://github.com/MrSmart00/Github-Client/workflows/Swift/badge.svg)
## 準備

1. xcodegenのインストール
2. `xcodegen generate` でプロジェクト生成
3. Githubトークン作成
4. 以下のコードをSecret.swiftに追加し `YOUR_GITHUB_TOKEN` を3で作成したトークンに置換する
```Secret.swift
public enum Secret {
    static let githubToken = "<YOUR_GITHUB_TOKEN>"
}
```

## やった事

- [x] Github GraphQLから情報を取得する
- [x] 自身のRepository一覧を表示する
- [x] Repositoryを検索できる
- [x] 選択したRepositoryの内容を表示する
- [x] Apolloをアプリから分離する
- [x] Guthub Actionsを使ってCI環境構築
