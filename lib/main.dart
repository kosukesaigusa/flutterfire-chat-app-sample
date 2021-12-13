import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:cloud_functions_app_sample/models/app_user/app_user.dart';
import 'package:cloud_functions_app_sample/store/store.dart';
import 'package:cloud_functions_app_sample/theme/theme.dart';
import 'package:cloud_functions_app_sample/utils/datetime.dart';
import 'package:cloud_functions_app_sample/utils/snackbar.dart';
import 'package:cloud_functions_app_sample/widgets/image_widget/cached_network_image.dart';
import 'package:cloud_functions_app_sample/widgets/loading_widget/spinkit_circle.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final store = Store();
  runApp(
    ChangeNotifierProvider<Store>.value(
      value: store,
      builder: (context, child) => const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Cloud Functions app',
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final store = Store();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chats'), centerTitle: false),
      body: FirestoreBuilder<AttendingChatRoomQuerySnapshot>(
        // ref: attendingChatRoomsRef(store.nonNullUid),
        ref: attendingChatRoomsRef(userId: 'EqGWv1sZAMNiVifprM5ku4DNzKu2'),
        builder: (context, snapshot, child) {
          if (snapshot.hasError) {
            return const Text('Something went wrong!');
          }
          if (!snapshot.hasData) {
            return const PrimarySpinkitCircle(size: 48);
          }
          final querySnapshot = snapshot.requireData;
          return ListView.separated(
            separatorBuilder: (context, index) => const Divider(height: 0),
            itemCount: querySnapshot.docs.length,
            itemBuilder: (context, index) {
              final attendingChatRoom = querySnapshot.docs[index].data;
              return InkWell(
                onTap: () {
                  showFloatingSnackBar(context, 'まだ何も起こりません。');
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleCachedNetworkImage(
                        radius: 48,
                        imageURL: attendingChatRoom.imageURL ?? '',
                      ),
                      const Gap(16),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    '${attendingChatRoom.name}',
                                    style: bold16,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const Gap(16),
                                Text(
                                  dateTimeString(datetime: attendingChatRoom.updatedAt),
                                  style: regular12,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    attendingChatRoom.lastMessage,
                                    style: regular12,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const Gap(48),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
