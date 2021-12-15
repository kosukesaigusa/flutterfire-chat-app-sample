import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions_app_sample/models/app_user/app_user.dart';
import 'package:cloud_functions_app_sample/utils/task_result/firebase_task_result.dart';

Future<FirebaseTaskResult> resetUnreadCount(AttendingChatRoomDocumentReference ref) async {
  try {
    await ref.reference.update({'unreadCount': 0});
  } on FirebaseException catch (e) {
    return FirebaseTaskResult(isSucces: false, message: 'エラーが発生しました。', code: e.code);
  }
  return FirebaseTaskResult(isSucces: true, message: '未読カウントをリセットしました。');
}
