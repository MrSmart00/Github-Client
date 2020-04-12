# Github-Client

## 準備

1. xcodegenのインストール
2. `xcodegen generate` でプロジェクト生成
3. Githubトークン作成
4. Secret.swiftを作成プロジェクトに作成
5. 以下のコードをSecret.swiftに追加し `YOUR_GITHUB_TOKEN` を3で作成したトークンに置換する
```Secret.swift
enum Secret {
    static let githubToken = "<YOUR_GITHUB_TOKEN>"
}
```

## やった事

- [x] Github GraphQLから情報を取得する
- [x] 自身のRepository一覧を表示する
- [x] Repositoryを検索できる
- [x] 選択したRepositoryの内容を表示する
- [ ] Apolloをアプリから分離する
