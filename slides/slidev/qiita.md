# 期待大！FlutterFire の Cloud Firestore ODM を触ってみた

## はじめに

日本時間の 2021 年 12 月 8 日 に Flutter SDK のバージョン 2.8 の安定版のリリースと同時に、Cloud Firestore ODM も発表されました！🙌

紹介記事を読みながら感銘を受け、これは期待大だと確認して、早速かんたんに触ってみたので 2021 年末のアドベントカレンダーの記事としてまとめます。

記事を執筆している 2021 年 12 月 16 日時点で、まだアルファ版ということで不具合の報告が確認されたり、実装予定・未実装の機能なども多くあるようなので、この記事をお読みの時期と合わせてご注意ください。Cloud Firestore ODM に大きな変更があれば、できるだけ追随して記事更新していこうと思います。

公式の各種情報は、次のようなリンクを参考にしてください。

- パッケージ (pub.dev)：[cloud_firestore_odm 1.0.0-dev.4](https://pub.dev/packages/cloud_firestore_odm)
- ドキュメント (FlutterFire)：[Cloud Firestore ODM](https://firebase.flutter.dev/docs/firestore-odm/overview/)
- Flutter 2.8 の紹介：[What’s New in Flutter 2.8
](https://medium.com/flutter/whats-new-in-flutter-2-8-d085b763d181)
- GitHub のディスカッション：[Firestore ODM Feedback](https://github.com/FirebaseExtended/flutterfire/discussions/7475)

また、この記事の内容は、記事を書く数日前に、私もコミュニティのメンバーとして参加している[Flutter 大学](https://kboyflutteruniv.com/)で、中心として毎週水曜日の夜に定期開催させて頂いている共同勉強会の題材としても取り上げました！

Flutter エンジニアはもちろん、エンジニアでない方も、これから学習していく方も参加している、リアルな繋がりも含めて、活発でとても雰囲気の良いコミュニティですのでご興味のある方は覗いてみてください。

その際使用した資料は次のようなリンクです。

- GitHub リポジトリ：[flutterfire-chat-app-sample](https://github.com/KosukeSaigusa/flutterfire-chat-app-sample)
- スライド資料：[slidev](https://flutterfire-chatapp-sample.netlify.app/)

## Cloud Firestore ODM の概要

Cloud Firestore ODM はその名の通り、Cloud Firestore の Object/Document Mapper として機能します。

FlutterFire（この文脈では Flutter x Firestore）のアプリ開発を、型安全にボイラープレートコードを減らして、より快適に行うことを目指しているように思われます。

Object/Document Mapper (ODM) として機能するというのは、Firestore のドキュメントと Dart クラス（データクラス・オブジェクト）を紐付けるコードの自動生成ができるということで、決められた形式の少ない記述量で、ドキュメント ↔ Dart クラス間のシリアライズ・デシリアライズ (fromFirestore, toFirestore) の処理を含む便利なクラスやメソッドが自動生成されます。

ざっくり言うと、下記のようにトップレベルの `/users` コレクションのドキュメントを意味する `User` クラスを定義するだけで、ユーザーコレクション・ドキュメントに対する各種の Read/Write のメソッドが生成されるのに加え、すでに Dart の `User` クラスに紐付いた `UserCollectionReference` や `UserDocumentReference` という型安全なコレクション・ドキュメントのレファレンスが生成されます。

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
UserDocumentReference userRef({required String userId}) =>
    UserDocumentReference(usersRef.doc(userId).reference);
```

さらに、`FirestoreBuilder` というウィジェットも使用可能になるので、下記のように `ref` プロパティに `User` 型に紐付いた `UserCollection` である `usersRef` を指定するだけで、Firestore の `/users` コレクションのドキュメント一覧をリアルタイム取得するコードを型安全に完結に書くことができてしまいます。

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

つまり、Firestore DOM とは（またはそれが今後目指しているのは）ざっくり言うと、いままで

- json_serializable や freezed を使ってデータクラスと fromFirestore, toFirestore メソッドを定義していた
- それらを `withConverter` と組み合わせて型安全な Collection, Document のレファレンスにしていた
- `FutureBuilder` や `StreamBuilder` を使って Firestore のデータを画面に表示していた

のを、全てまとめて一緒くたに行えるようなパッケージだと言えそうです！（※ただしこの記事を執筆している 2021 年 12 月 16 日時点ではアルファ版であり、freezed との連携はできないことや、その他の制約や今後実装予定・未実装の機能が多くある点にはご注意ください）。

ただでさえクライアントとサーバの垣根が低い開発環境だと言える FlutterFire なアプリが、さらにシームレスに、ウィジェットのすぐ背後に Firestore のコレクション・ドキュメントが透けて見えるような世界観に感銘を受けました。

スプレッドシートや Figma のデザインデータからアプリを素早く作れます、といった文脈のサービスは今までも見かけていましたし、FlutterFire なアプリ開発との親和性の高い非常に興味深い取り組みだなと思っていましたが、今後は Firestore ODM も使用することで、私たちは Firestore のドキュメント (JSON) を単に並べて色を付けることには労力を割くことなく、yaml や json のようなドキュメントに決められた形式でスキーマ定義・データモデリングさえしてしまえば、アプリの基本的な画面や機能が自動で生成される、などという想像もできてしまいます。

## Firestore ODM を使わずに似たことを実現すると

比較のために Firestore ODM を使用せずに型安全を保ちながら FlutterFire なアプリを開発するときを考えてみましょう。

たとえば freezed を使用して次のように User クラスを定義しするでしょう。

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String name,
    required int age,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  factory User.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    final data = documentSnapshot.data()! as Map<String, dynamic>;
    return User.fromJson(data);
  }
}
```

そして、`/users` コレクションからユーザー一覧を取得する際には、`withConverter` を使うことで型安全を保ち、次のようなコードを書きます。

```dart
Stream<List<User>> usersStream() {
  final snapshots = FirebaseFirestore.instance.collection('users')
      .withConverter<User>(
        fromFirestore: (snapshot, _) => User.fromDocumentSnapshot(snapshot),
        toFirestore: (obj, _) => obj.toJson(),
      )
      .snapshots();
  final result = snapshots.map((qs) => qs.docs.map((qds) => qds.data()).toList());
  return result;
}
```

このユーザー一覧を `StreamBuilder` を用いて画面に表示するなら次のようになるでしょう。

```dart
class UsersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      ref: usersStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) return Text('Something went wrong!');
        if (!snapshot.hasData) return Text('Loading users...');
        final querySnapshot = snapshot.requireData;
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

さらに例えばユーザーを年齢の降順に並び替えたければ、

```dart
Stream<List<User>> usersStreamOrderByAge() {
  final snapshots = FirebaseFirestore.instance.collection('users')
      .withConverter<User>(
        fromFirestore: (snapshot, _) => User.fromDocumentSnapshot(snapshot),
        toFirestore: (obj, _) => obj.toJson(),
      )
      .orderBy('age')
      .snapshots();
  final result = snapshots.map((qs) => qs.docs.map((qds) => qds.data()).toList());
  return result;
}
```

これに相当するコードを書く必要があります。

もちろん上記の通りでもそれなりにスマートに、型安全を保ちながら Firestore からのドキュメントの読み込みとウィジェットでの表示ができているようにも思えます。

## Firestore ODM を用いると

一方、やや繰り返しの説明となりますが、Firestore ODM による型安全なコレクション・ドキュメントレファレンスの自動生成と `FirestoreBuilder` を使用すると、`withConverter` と `StreamBuilder` や `FutureBuilder` を自分自身で書いていた箇所を省くことができます。さらに自動で `whereAge` や
 `orderByAge` のような where 句、order by 句の条件も生成されるので、それらも含めて型安全に記述量少なく同じことを実現することができます。

クラス定義の手間はそれほど変わりません。

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
UserDocumentReference userRef({required String userId}) =>
    UserDocumentReference(usersRef.doc(userId).reference);
```

`FirestoreBuilder` を使えば `StreamBuilder` や `withConverter` のことは意識する必要がなくなります。せっかくなので `orderByAge()` も `FirestoreBuilder` の `ref` の部分につけておきました。

```dart
class UsersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FirestoreBuilder<UserQuerySnapshot>(
      ref: usersRef.orderByAge(),
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

さらに、`FirestoreBuilder` クラスの内部を覗いてみると、そのコンストラクタの上のコメントに次のようなことが書いてあります。

> This is a better solution than [StreamBuilder] for listening a Firestore
> reference, as [FirestoreBuilder] will cache the stream created with `ref.snapshots`,
> which could otherwise result in a billable operation.

つまり、キャッシュを利用した低コストな読み込みという観点で、`FirestoreBuilder` の方が優れているようです。

## まとめ

以上の説明で、FlutterFire なアプリを開発する仲間であるみなさんと、Firestore ODM でできることやその魅力を共有できていれば嬉しいです！もしよろしければ SNS 等でも繋がり情報交換しましょう🧑‍💻

- [Twitter @KosukeSaigusa](https://twitter.com/KosukeSaigusa)
- [GitHub @KosukeSaigusa](https://github.com/KosukeSaigusa)
- [Qiita @KosukeSaigusa](https://qiita.com/KosukeSaigusa)

型安全で高効率、開発者体験もグンと上がっていくことになりそうな Firestore ODM の今後の発展を、同時期に発表された FlutterFire UI などとも一緒に追いかけていければ、そして私も何かしらの形でそのような OSS のコミュニティに貢献していければ良いな、と思っています🚀

最後までお読み下さりありがとうございました！！

---

他の投稿のご紹介：

- [Firestore Security Rules の書き方と守るべき原則](https://qiita.com/KosukeSaigusa/items/18217958c581eac9b245)
- [Firebase 公式動画から『Firestore の DB 設計の基礎』を学ぶ](https://qiita.com/KosukeSaigusa/items/860b5a2a6a02331d07cb)
