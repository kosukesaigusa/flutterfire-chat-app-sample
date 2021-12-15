---
theme: default
background: https://source.unsplash.com/collection/94734566/1920x1080
class: 'text-center'
highlighter: shiki
info: |
  ## Slidev Starter Template
  Presentation slides for developers.

  Learn more at [Sli.dev](https://sli.dev)
fonts:
  sans: 'Roboto'
  serif: 'Roboto'
  mono: 'Fira Code'
---

# Firestore ODM を試しに触りつつ Firebase Emulator Suite と Cloud Functions を使った Flutter アプリ開発について

2021-12-15 (水) by Kosuke Saigusa

Flutter 大学共同勉強会

---

## 本日の発表内容

- サンプルコードと発表スライドを置いています：[GitHub リポジトリ](https://github.com/KosukeSaigusa/flutterfire-chat-app-sample)
- 先日発表されたばかりの [Cloud Firestore ODM](https://firebase.flutter.dev/docs/firestore-odm/overview/) を触ってみました
- [Firebase Local Emulator Suite](https://firebase.google.com/docs/emulator-suite) と Cloud Functions for Firebase を使った開発について軽く紹介します
- その他、Flutter x Firebase のアプリのより良いプラクティス・開発者体験を皆で議論していくためのネタになるような話をしてみたいと思っています

今日はサンプルのソースコードや参考文献を一緒に眺めながら進める形式を中心に行うので、いつも通り（いつも以上に！）Slack やお喋りをしながらわいわいやりましょう！🙌

---

## 今日触れる知識など

- Firestore ODM でできること
- Firestore ODM を使ったモデルやレファレンスコードの生成
- FutureBuilder / StreamBuilder ならぬ FirestoreBuilder の登場
- 型安全に Firestore のドキュメントを読み書きする
- Flutter x Firebase のアプリに Cloud Functions の導入が重要な理由
- 題材にするチャットアプリのモデリング
- Firebase Local Emulator Suite について（軽く）
- Cloud Functions (TS) でも型安全に読み書きしよう！
- 各種 Firebase Local Emulator Suite に Flutter アプリを接続する
- Firebase Local Emulator Suite で iOS Simulator の Flutter アプリを動かす

---

## Cloud Firestore ODM

- パッケージ：[cloud_firestore_odm 1.0.0-dev.4](https://pub.dev/packages/cloud_firestore_odm)
- ドキュメント：[Cloud Firestore ODM](https://firebase.flutter.dev/docs/firestore-odm/overview/)

```bash
flutter pub add cloud_firestore_odm
flutter pub add json_annotation
```

FlutterFire (Flutter x Cloud Firestore) のアプリ開発を **型安全** に開発していくためのパッケージ。

Firestore Document ↔ Dart クラスのコードの自動生成ができ、**Object/Document Mapper** (ODM) として機能する。

json_serializable や freezed と `withConverter` を `FutureBuilder` や `StreamBuilder` 組み合わせて JSON (Document) 色付け（Flutter のウィジェットとして描画）していたのを、型安全に、より少ないコードでまとめて行えるようになることを目指しているイメージか。

さらに、対応する `CollectionReference` や `DocumentReference` にも、**Firestore のパスに紐付いた形で** 型が付いたコードも自動生成されるので快適！

とはいえ、アルファ版ということでまだまだ不具合や未実装（実装予定）の機能は多くあるみたい。

[Firestore ODM Feedback](https://github.com/FirebaseExtended/flutterfire/discussions/7475)

---

## Cloud Firestore ODM によるクラス定義

私たちがやるのは、Firestore の Document と対応するデータクラス風の定義をこんなふうに書いて、

```dart
import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User({
    required this.name,
    required this.age,
    required this.email,
  });

  final String name;
  final int age;
  final String email;
}

@Collection<User>('users')
final usersRef = UserCollectionReference();
```

---

## Cloud Firestore ODM によるコードの自動生成

自動生成コマンドを実行するかんたんなお仕事。

```shell
flutter pub run build_runner build --delete-conflicting-outputs
```

生成されたコードは後で一緒に見てみましょう。

---

## FirestoreBuilder ウィジェットで描画

```dart
@Collection<User>('users')
final usersRef = UserCollectionReference();

class UsersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FirestoreBuilder<UserQuerySnapshot>(
      ref: usersRef,
      builder: (context, AsyncSnapshot<UserQuerySnapshot> snapshot, Widget? child) {
        if (snapshot.hasError) return Text('Something went wrong!');
        if (!snapshot.hasData) return Text('Loading users...');
        UserQuerySnapshot querySnapshot = snapshot.requireData;
        return ListView.builder(
          itemCount: querySnapshot.docs.length,
          itemBuilder: (context, index) {
            User user = querySnapshot.docs[index].data;
            return Text('User name: ${user.name}, age ${user.age}');
          },
        );
      }
    );
  }
}
```

---

## Flutter Firestore ODM のかんたんなまとめ

- json_serializable や freezed と `withConverter` を `FutureBuilder` や `StreamBuilder` が全部一緒になって、Firestore の CollectionReference, DocumentReference に勝手に型をつけてくれる。
- Collection や Document のパスを何度も書く必要がない。
- ただでさえ クライアント ↔ サーバ の距離感が近く感じる Cloud Firestore を、Flutter アプリとよりシームレスに繋ぐような世界観。
- ボイラープレートコードが減って、開発効率と開発者体験がグンと上がることは間違いないので今後に期待！
- FlutterFire UI と合わせて、無限スクロールとかパジネーションにも今後対応していくのだとか！

---

## Flutter x Firebase のアプリに Cloud Functions の導入が重要な理由

- Firestore はクエリは貧弱だが書き込みは優秀
- クライアントサイドジョインのみで達成できなユースケースも多く、必要に応じてデータの非正規化も検討していく
- Security Rules をよりシンプルに記述したり、安定した運営をしたりしていくためには、できる限り読み書きをするコレクションを分けて、サーバサイドからも書き込んでいく必要がある

---

## 題材にするチャットアプリのモデリング

モデリングの一例を [docs/scheme.jsonc](https://github.com/KosukeSaigusa/flutterfire-chat-app-sample/blob/main/docs/scheme.jsonc) に置いています（※これがベストの例・唯一の正解というわけではありません）。

- チャットルーム一覧ページ
- チャットルーム

だけがあるかんたんなチャットアプリを題材にしています。

Firestore ODM の活用例や自動生成されたコードも含めて、全体を軽く一緒に読んでみましょう。

---

## Cloud Functions (TS) でも型安全に読み書きしよう

TypeScript で書く Cloud Functions でも、できる限り型安全に読み書きしたいので、

`tsconfig.json` をよしなに設定しつつ、`types` ディレクトリ下に `*.d.ts` のような型定義ファイルをつくります。

今回はそこに `interface` を定義することにしました。

```ts
interface AppUser {
  reference?: FirebaseFirestore.DocumentReference | null;
  createdAt?: FirebaseFirestore.Timestamp | null;
  updatedAt?: FirebaseFirestore.Timestamp | null;
  name: string;
  imageURL: string | null;
}
```

---

## converter を定義する

`withConverter` で使用するための converter も対応する分だけ作っておくと気持ちよくなれます。

```ts
import { FieldValue } from '@google-cloud/firestore'

export const appUserConverter = {
    fromFirestore(qds: FirebaseFirestore.QueryDocumentSnapshot): AppUser {
        const data = qds.data()
        return {
            reference: qds.ref,
            createdAt: data.createdAt ?? null,
            updatedAt: data.updatedAt ?? null,
            name: data.name,
            imageURL: data.imageURL ?? null,
        }
    },
    toFirestore(obj: AppUser): FirebaseFirestore.DocumentData {
        return {
            createdAt: FieldValue.serverTimestamp(),
            updatedAt: FieldValue.serverTimestamp(),
            name: obj.name,
            imageURL: obj.imageURL,
        }
    }
}
```

---

## 各種 Firebase Local Emulator Suite に Flutter アプリを接続する

これを `runApp` の前に実行しておきます。`dart-define` などでローカルエミュレータに接続するフラグを受け取っておくと良いです。

```dart
Future<void> setUpLocalEmulator() async {
  const localhost = 'localhost';
  FirebaseFirestore.instance.settings = Settings(
    host: Platform.isAndroid ? '10.0.2.2:8080' : 'localhost:8080',
    sslEnabled: false,
    persistenceEnabled: true,
  );
  FirebaseFirestore.instance.useFirestoreEmulator(localhost, 8080);
  FirebaseFunctions.instance.useFunctionsEmulator(localhost, 5001);
  FirebaseStorage.instanceFor(bucket: 'default-bucket');
  await Future.wait(
    [
      FirebaseAuth.instance.useAuthEmulator(localhost, 9099),
      FirebaseStorage.instance.useStorageEmulator(localhost, 9199),
    ],
  );
}
```

---

## Firebase Local Emulator Suite で iOS Simulator の Flutter アプリを動かす

デモ的にいろいろなコードを見てみましょう！
