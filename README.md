# Github-Client

## 準備
Githubトークンを作成して、

```
enum Secret {
    static let githubToken = "<YOUR GITHUB TOKEN>"
}
```
`<YOUR GITHUB TOKEN>` に先ほど作成したトークンを設定して、
上記enumをどこからでも読める位置に追記してください。

## やった事

- [x] Github GraphQLから情報を取得する
- [x] 自身のRepository一覧を表示する
- [x] Repositoryを検索できる
- [x] 選択したRepositoryの内容を表示する
