# Emoine

## 開発環境

golang 1.17
node 16

download https://github.com/protocolbuffers/protobuf/releases

```shell
$ go install google.golang.org/protobuf/cmd/protoc-gen-go
```

初回のみ必要
```shell
$ make proto
$ cd client
$ npm i
```

Windowsの場合、`make proto`が実行できないので、代わりに以下を実行する
```shell
protoc -I ./docs --go_out=router/pb --go_opt=paths=source_relative ./docs/comment.proto
protoc -I ./docs --go_out=router/pb --go_opt=paths=source_relative ./docs/reaction.proto
protoc -I ./docs --go_out=router/pb --go_opt=paths=source_relative ./docs/state.proto
protoc -I ./docs --go_out=router/pb --go_opt=paths=source_relative ./docs/viewer.proto
protoc -I ./docs --go_out=router/pb --go_opt=paths=source_relative ./docs/message.proto
```

起動

```shell
$ make up
$ cd client
$ npm run dev
```

http://localhost:3000/ にアクセス

初回アクセス時はtraQにリダイレクトされるのでOAuth認証を承認し、その後リダイレクトされたページのURLの`https://emoine20.trap.jp`部分を`http://localhost:3000`に変更

終了
```shell
$ make down
```

### 開発環境のadmin権限

[docker-compose.yml の14行目](https://github.com/traPtitech/Emoine/blob/7e1dd81f28802efd9fc68e7931f3f62ce31310cf/docker-compose.yml#L14)にtraQのUUIDを追記することで、開発環境のadminに追加できる
